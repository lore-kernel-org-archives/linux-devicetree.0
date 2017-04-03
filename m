From: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [RFC PATCH 4/5] dt-bindings: soc/fsl: Update reserved memory
 binding for QBMan
Date: Mon, 3 Apr 2017 19:49:03 +0000
Message-ID: <VI1PR04MB32166AA6361CD6F24DBC3AAF86080@VI1PR04MB3216.eurprd04.prod.outlook.com>
References: <1490822037-6752-1-git-send-email-roy.pledge@nxp.com>
 <1490822037-6752-5-git-send-email-roy.pledge@nxp.com>
 <20170403154229.mf63zeiwv5naxyrr@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "robin.murphy-5wv7dgnIgG8@public.gmane.org" <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org" <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Madalin-Cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4/3/2017 11:42 AM, Rob Herring wrote:=0A=
> On Wed, Mar 29, 2017 at 05:13:56PM -0400, Roy Pledge wrote:=0A=
>> Updates the QMan and BMan device tree bindings for reserved memory=0A=
>> nodes. This makes the reserved memory allocation compatiable with=0A=
> s/compatiable/compatible/=0A=
>=0A=
>> the shared-dma-pool usage.=0A=
> This change is not backwards compatible. Please state that and explain =
=0A=
> why that is okay. If PPC needs to not change, then the old strings and =
=0A=
> properties should remain, but deprecated.=0A=
I think I can make the old device trees compatible since the=0A=
"compatible" string changed without too much effort or ifdefery in the=0A=
code.  However I would like to eventually see all PPC users move to the=0A=
new mode as I do believe it is more in alignment with the spirit of the=0A=
reserved-memory framework that is in the kernel.  Do I need to mention=0A=
the old mode in the binding.txt file?  I'm trying to keep things clean=0A=
so someone reading the binding doesn't get a headache and trying to=0A=
preserve my own sanity as we move forward with adding new features to=0A=
this driver.=0A=
=0A=
Roy=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
