From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v4 1/2] ehci-platform: Add support for
 controllers with multiple reset lines
Date: Fri, 4 Mar 2016 08:27:26 +0100
Message-ID: <56D938DE.10409@redhat.com>
References: <1456592339-31767-1-git-send-email-hdegoede@redhat.com>
 <1456592339-31767-2-git-send-email-hdegoede@redhat.com>
 <20160304043559.GA21743@kroah.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORB3HR4S3AKGQEHFXEHOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160304043559.GA21743-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 04-03-16 05:35, Greg Kroah-Hartman wrote:
> On Sat, Feb 27, 2016 at 05:58:58PM +0100, Hans de Goede wrote:
>> From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
>>
>> At least the EHCI/OHCI found on the Allwinnner H3 SoC needs multiple
>> reset lines, the controller will not initialize while the reset for
>> its companion is still asserted, which means we need to de-assert
>> 2 resets for the controller to work.
>>
>> Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> Changes in v2:
>> -Use the new reset_control_[de]assert_shared reset-controller functions
>> Changes in v3:
>> -Adjust for changes to shared-reset reset-controller functions
>> Changes in v4:
>> -Fix Ugly continuation line
>
> This breaks the build horribly :(
>
> As does patch 2/2, ugh.

As said in the cover letter:

"These patches apply on top of the related
reset-controller patches which have just been merged here:

git://git.pengutronix.de/git/pza/linux.git reset/next"

I guess I should have done s/apply on top of/depend on/
in the above bit. These patches apply fine without those
changes, but indeed they will not build.

You may want to ask Philipp Zabel (added to the To: list)
to create a topic branch for this which you can merge into
your tree.

Regards,

Hans
