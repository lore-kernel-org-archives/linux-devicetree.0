From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ohci-/ehci-platform: Change compatible string to ?hci-platform
Date: Tue, 11 Feb 2014 18:04:32 +0100
Message-ID: <52FA5820.9080905@redhat.com>
References: <Pine.LNX.4.44L0.1402111023240.1209-100000@iolanthe.rowland.org> <1635726.gc3dEs0zOi@wuerfel> <4195343.2rfzYCCiXV@lenovo>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBLNQ5GLQKGQEACSZ3RQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <4195343.2rfzYCCiXV@lenovo>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Florian,

On 02/11/2014 06:01 PM, Florian Fainelli wrote:
> Le mardi 11 f=E9vrier 2014, 16:43:37 Arnd Bergmann a =E9crit :
>> On Tuesday 11 February 2014 10:27:12 Alan Stern wrote:
>>> It might even be a good idea to change the "xhci-platform" string to
>>> match, it that doesn't cause too much trouble.
>>
>> The original xhci binding was contributed by Al Cooper, but I don't
>> see any dts files using it. I agree that xhci-generic is a better
>> name than xhci-platform, and I think we should make that the recommended
>> string. If Al or someone thinks the xhci-generic string might already
>> be used in production devices, we should however allow both names
>> in the binding and in the driver.
>=20
> The platform on which "xhci-platform" is currently used is Broadcom STB f=
or=20
> which Marc submitted the base support recently. The BCM7445 reference DTS=
 will=20
> probably be updated at some point to reflect that.

Note I've just send a patch with the xhci-platform -> generic-xhci change
Arnd requested. I've left xhci-platform in the list of compatible strings
for now (marked as deprecated in the docs), so there should be no issues
regardless of what the dts version getting merged ends up using.

Would be good if we could ensure it uses generic-xhci though, and then
drop the xhci-platform compatible all-together in a follow-up patch.

Regards,

Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
