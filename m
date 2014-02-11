From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Change compatible string
 from usb-ohci to ohci-platform
Date: Tue, 11 Feb 2014 16:21:10 +0100
Message-ID: <52FA3FE6.8040308@redhat.com>
References: <1392127826-31290-1-git-send-email-hdegoede@redhat.com> <1392127826-31290-2-git-send-email-hdegoede@redhat.com> <954E6E26-EEF1-4A0A-A9BC-D5CA918FAD43@codeaurora.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB4P75CLQKGQEFGVSKLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <954E6E26-EEF1-4A0A-A9BC-D5CA918FAD43-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/11/2014 04:06 PM, Kumar Gala wrote:
> 
> On Feb 11, 2014, at 8:10 AM, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> The initial versions of the devicetree enablement patches for ohci-platform
>> used "ohci-platform" as compatible string. However this was disliked by various
>> reviewers because the platform bus is a Linux invention and devicetree is
>> supposed to be OS agnostic. After much discussion I gave up and went with
>> the generic usb-ohci as requested.
>>
>> In retro-spect I should have stuck to my guns, because the dts files for many
>> existing boards already claim to be compatible with "usb-ohci", ie they have:
>>
>> 	compatible = "ti,ohci-omap3", "usb-ohci";
>>
>> In theory this should not be a problem since the "ti,ohci-omap3" entry takes
>> presedence, but in practice using a conflicting compatible string is an issue,
>> because it makes which driver gets used depent on driver registration order.
>>
>> This patch changes the compatible string claimed by ohci-platform (back) to
>> "ohci-platform", avoiding the driver registration / module loading ordering
>> problems. Note that there already is a precedent for using ?hci-platform, in
>> the form of xhci-platform.c using "xhci-platfrom" as compatible string.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> Documentation/devicetree/bindings/usb/usb-ohci.txt | 4 ++--
>> drivers/usb/host/ohci-platform.c                   | 2 +-
>> 2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Documentation/devicetree/bindings/usb/usb-ohci.txt
>> index 6933b0c..a8e576a 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
>> +++ b/Documentation/devicetree/bindings/usb/usb-ohci.txt
>> @@ -1,7 +1,7 @@
>> USB OHCI controllers
>>
>> Required properties:
>> -- compatible : "usb-ohci"
> 
> Why not leave 'usb-ohci' and deprecate it?

As it was introduced just a couple of days ago in linux-next, and has never seen
the light in any released kernel.

Regards,

Hans
