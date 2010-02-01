From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [resend] Make the kernel accept ePAPR style phandle information
Date: Mon, 1 Feb 2010 14:20:32 -0700
Message-ID: <fa686aa41002011320p4b2bd7b9r53b58892cbe1ff6@mail.gmail.com>
References: <20100201045242.GB8095@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20100201045242.GB8095@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 31, 2010 at 9:52 PM, David Gibson
<david@gibson.dropbear.id.au> wrote:
> Grant, I've updated this for your current test-devicetree branch.
> Please apply.
>
> Currently when processing flattened device trees, the kernel expects
> the phandle in a property called "linux,phandle". =A0The ePAPR spec -
> not being Linux specific - instead requires phandles to be encoded in
> a property named simply "phandle". =A0This patch makes the kernel accept
> either form when unflattening the device tree.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Applied, thanks.

g.
