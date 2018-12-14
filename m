From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 1/4] ARM: dts: aspeed: Add sensors devices for Facebook
Date: Fri, 14 Dec 2018 11:18:02 -0800
Message-ID: <c1e35845-cb07-048f-bcf7-d7239a387027@linux.intel.com>
References: <20181213195319.1333402-1-vijaykhemka@fb.com>
 <CACPK8XfAXDHqWcD=OKm4UhCh-+-7GBxL02Fi9_jgdmo2ZQZSjg@mail.gmail.com>
 <B6C3C92D-1F9E-4425-ABF5-718D1A6755EB@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <B6C3C92D-1F9E-4425-ABF5-718D1A6755EB@fb.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vijay Khemka <vijaykhemka@fb.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "james.feist@linux.intel.com" <james.feist@linux.intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Vijay,

On 12/14/2018 10:11 AM, Vijay Khemka wrote:
> On 12/13/18, 2:56 PM, "Joel Stanley" <joel@jms.id.au> wrote:

<snip>

>      > +               oemname0 = "MB_P3V3";
>      > +               oemname1 = "MB_P5V";
>      > +               oemname2 = "MB_P12V";
>      > +               oemname3 = "MB_P1V05";
>      > +               oemname4 = "MB_PVNN_PCH_STBY";
>      > +               oemname5 = "MB_P3V3_STBY";
>      > +               oemname6 = "MB_P5V_STBY";
>      
>      "oemname" isn't part of the upstream bindings. Is this something you
>      have patches for?
> This is a workaround field used by dbus-sensors application to avoid overlay for dynamic detection of devices based on json file definition.
> 
> Can you please also review other 3 patches in this series.
>      
> 

These oemname settings should not be added into here. You can add these
information into configuration of entity manager which uses overlay
templates for dbus-sensors. Also, as Joel said, "oemname" isn't part of
the upstream bindings.

Cheers,
Jae
