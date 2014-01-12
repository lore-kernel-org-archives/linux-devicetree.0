From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: Re: [PATCH v4 0/2] ohci and ehci-platform clks, phy and dt support
Date: Sun, 12 Jan 2014 16:04:43 +1300
Message-ID: <52D2064B.3010103@prisktech.co.nz>
References: <Pine.LNX.4.44L0.1401111728150.16586-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1401111728150.16586-100000-pYrvlCTfrz9XsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/01/14 11:30, Alan Stern wrote:
> On Fri, 10 Jan 2014, Hans de Goede wrote:
>
>> Hi,
>>
>> On 01/11/2014 12:50 AM, Sergei Shtylyov wrote:
>>> Hello.
>>>
>>> On 01/11/2014 01:46 AM, Hans de Goede wrote:
>>>
>>>> Here is v4 of my ohci and ehci-platform clks, phy and dt support patch-set,
>>>> this version should be 100% ready for merging upstream.
>>>      I see you've decided to completely ignore my opinion. NAK, FWIW.
>> I'm sorry but the whole prefix thing has become a thing of -ETOOMUCHBIKESHEDDING,
>> everyone except you seems to be fine with mmio and and one point in time we
>> need to make a decision and move forward.
> If this isn't beating a dead horse...  Maybe everyone can agree on a
> name like ohci-generic or generic-ohci.  That seems like a pretty good
> description of the hardware that the platform driver can handle.
>
> Alan Stern
I prefer the -generic option, although generic- is equally fine - Having 
said that, I don't really care if it's called mmio either (although this 
does seem less 'descriptive').

Regards
Tony Prisk
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
