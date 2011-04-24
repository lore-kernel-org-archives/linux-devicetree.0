From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Fix babbage.dts memory node
Date: Sun, 24 Apr 2011 08:28:52 +0800
Message-ID: <20110424002851.GA5161@S2100-06.ap.freescale.net>
References: <1303453526-27523-1-git-send-email-shawn.guo@linaro.org>
	<BANLkTikNodocgONEpqASBy1iAZzu50w3vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikNodocgONEpqASBy1iAZzu50w3vQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Zach Pfeffer <zach.pfeffer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 23, 2011 at 04:39:15PM -0500, Zach Pfeffer wrote:
> On 22 April 2011 01:25, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Without device_type property set as memory for the node, the generated
> > dtb can still work when it gets passed to kernel by u-boot, since
> > u-boot will fix it up. =A0But kernel will not boot due to that it fails
> > to parse the memory node, when the dtb is appended to kernel image as
> > it is.
> =

> I'm a little confused. The first part of the statement implies that
> the kernel will boot without the device_type property, but the second
> part of the statement says that the kernel won't boot.
> =

The second part is talking about using John Bonesio's patch to append
dtb to zImage like: 'cat zImage babbage.dtb > zImage_w_dtb'.

-- =

Regards,
Shawn
