From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [RFC PATCH] interconnect: Replace of_icc_get() with icc_get()
 and reduce DT binding
Date: Wed, 25 Sep 2019 11:15:22 +0200
Message-ID: <20190925091522.jf5q2jdo6njfkxto@gilmour>
References: <20190925054133.206992-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5486269731441519147=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190925054133.206992-1-swboyd@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, David Dai <daidavid1@codeaurora.org>, linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5486269731441519147==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aomtcuidegtr2wsv"
Content-Disposition: inline


--aomtcuidegtr2wsv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

On Tue, Sep 24, 2019 at 10:41:33PM -0700, Stephen Boyd wrote:
> The DT binding could also be simplified somewhat. Currently a path needs
> to be specified in DT for each and every use case that is possible for a
> device to want. Typically the path is to memory, which looks to be
> reserved for in the binding with the "dma-mem" named path, but sometimes
> the path is from a device to the CPU or more generically from a device
> to another device which could be a CPU, cache, DMA master, or another
> device if some sort of DMA to DMA scenario is happening. Let's remove
> the pair part of the binding so that we just list out a device's
> possible endpoints on the bus or busses that it's connected to.
>
> If the kernel wants to figure out what the path is to memory or the CPU
> or a cache or something else it should be able to do that by finding the
> node for the "destination" endpoint, extracting that node's
> "interconnects" property, and deriving the path in software. For
> example, we shouldn't need to write out each use case path by path in DT
> for each endpoint node that wants to set a bandwidth to memory. We
> should just be able to indicate what endpoint(s) a device sits on based
> on the interconnect provider in the system and then walk the various
> interconnects to find the path from that source endpoint to the
> destination endpoint.

The dma-mem name is used by the OF core to adjust the mapping of the
devices as well. So, any solution needs to be generic (or provide a
generic helper).

Maxime

--aomtcuidegtr2wsv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYswKgAKCRDj7w1vZxhR
xe8UAQC3EqIcKg882wsQj/TdlIO/sf9HoBIDnQnVNJ2t2kaPsAD/Qsa+D9ZQUlKc
qhYx4agifh1/WXVN4H+Wb39VO4vx5wk=
=Z0s1
-----END PGP SIGNATURE-----

--aomtcuidegtr2wsv--


--===============5486269731441519147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5486269731441519147==--
