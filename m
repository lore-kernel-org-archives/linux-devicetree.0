From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 1/2] usb: dwc3: keystone: Add PM_RUNTIME Support to DWC3 Keystone USB driver
Date: Thu, 17 Aug 2017 15:31:48 +0300
Message-ID: <87o9reqssr.fsf@linux.intel.com>
References: <20170816215408.13076-1-fcooper@ti.com> <20170816215408.13076-2-fcooper@ti.com> <87r2waqu1s.fsf@linux.intel.com> <926be30f-3a97-ab81-876f-610bdd57775d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <926be30f-3a97-ab81-876f-610bdd57775d@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Franklin S Cooper Jr <fcooper@ti.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, ssantosh@kernel.org, linux@armlinux.org.uk, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, rogerq@ti.com
List-Id: devicetree@vger.kernel.org


Hi,

Franklin S Cooper Jr <fcooper@ti.com> writes:
>> Franklin S Cooper Jr <fcooper@ti.com> writes:
>>> For 66AK2Gx there is a requirement to use PM Runtime to properly manage
>>> clocks and the power domains. Therefore, add PM runtime support. Remove
>>> legacy clock api's calls since other users of this driver worked without
>>> these clock apis calls.
>>>
>>> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
>>> ---
>> 
>> I already have the previous version of this in my tree. Seems like the
>> only difference was on binding document, right? Do I need to change
>> anything in my 'next' and/or 'testing/next' branches?
>
> Correct the binding document is the only difference. Both of your
> branches looks good.

cool, thanks :-)

-- 
balbi
