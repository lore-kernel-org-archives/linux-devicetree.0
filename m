From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: sunxi: Add driver for sunxi usb phy
Date: Sun, 09 Feb 2014 14:29:14 +0100
Message-ID: <52F782AA.5010207@redhat.com>
References: <1391790801-27864-1-git-send-email-hdegoede@redhat.com> <CAGb2v67L1X63Pp10H6MFApkLzCvwOokxSW+fH6KquDnqaRGRmQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBS4F32LQKGQEEU2XXHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v67L1X63Pp10H6MFApkLzCvwOokxSW+fH6KquDnqaRGRmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/08/2014 05:32 AM, Chen-Yu Tsai wrote:
> On Sat, Feb 8, 2014 at 12:33 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> The Allwinner A1x / A2x SoCs have 2 or 3 usb phys which are all accessed
>> through a single set of registers. Besides this there are also some other
>> phy related bits which need poking, which are per phy, but shared between the
>> ohci and ehci controllers, so these are also controlled from this new phy
>> driver.
>>

<snip>

>> +               snprintf(name, sizeof(name), "usb%d_reset", i);
>> +               reset = devm_reset_control_get(dev, name);
>> +               if (IS_ERR(phy)) {
>> +                       dev_err(dev, "failed to get reset %s\n", name);
>> +                       return PTR_ERR(phy);
>> +               }
>
> Wrong variable checked for error here that I pointed out before is still wrong.

Ah, yes my bad, I'll do a v3 fixing this, and switching to using register names as
Maxime requested. Don't know whether I'll be able to send v3 today as I'm currently
on the road. If not I'll try to get it out the door tomorrow.

Regards,

Hans
