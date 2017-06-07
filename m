From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 0/3] Support for USB DRD Phy driver for NS2
Date: Wed, 7 Jun 2017 19:09:21 +0530
Message-ID: <d3ded8c2-33c4-96fa-59f1-47dbc5b7e165@ti.com>
References: <1496408439-30431-1-git-send-email-raviteja.garimella@broadcom.com>
 <4824c415-ea31-f252-7e94-ed3e3b2c064c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4824c415-ea31-f252-7e94-ed3e3b2c064c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Friday 02 June 2017 09:23 PM, Florian Fainelli wrote:
> 
> 
> On 06/02/2017 06:00 AM, Raviteja Garimella wrote:
>>
>> Raviteja Garimella (3):
>>   dt-bindings:phy:Add DT bindings documentation for NS2 USB DRD phy
>>   phy:phy-bcm-ns2-usbdrd:Broadcom USB DRD Phy driver for Northstar2
>>   arm64: dts: NS2: Add USB DRD PHY device tree node
> 
> For future submission can you be consistent in how you create your
> subjects and how PHY vs. Phy or phy is used? For instance this would be
> much better:
> 
> dt-bindings: phy: Add DT bindings documentation for NS2 USB DRD PHY
> phy: phy-bcm-ns2-usbdrd: Broadcom USB DRD PHY driver for Northstar 2

+1

-Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
