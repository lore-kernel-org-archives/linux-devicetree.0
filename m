From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 11:58:25 +1000
Message-ID: <BANLkTimFnfgiQ5aMq_KwqHP8p92pjOJJwg@mail.gmail.com>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
	<20110418160658.GD23814@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110418160658.GD23814-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2011 at 2:06 AM, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hi,
>
>> For example with "uio" compatible string:
>> static const struct of_device_id __devinitconst uio_of_genirq_match[] =
=3D {
>> =A0 =A0 =A0 { .compatible =3D "uio", },
>> =A0 =A0 =A0 { /* empty for now */ },
>> };
>
> Please use a proper example with "vendor,device".
> (And after that it won't be empty anymore)

My vote is, and always has been 'generic-uio' :)

Putting some random vendor/device string in there is just nuts. Do you
really want a kernel patch every time some one binds their device to
it?

Or, is there no expectation that anybody would attempt to merge such a
pointless patch to begin with?

As we discussed at ELC, putting a real vendor/device in there is also
broken because all instances in the system wil bind to the generic
uio, which is not necessarily what is desired.

I know the arguments against the 'generic-uio' tag, but come on, let's
look at the lesser of two evils here!  I call BS on this DTS purity.

John
