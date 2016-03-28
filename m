From: Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH 0/4] Implement USB device/host switch for Vybrid
Date: Mon, 28 Mar 2016 08:28:09 -0700
Message-ID: <3c2e72efc8cae93ff31be1b44f9a02b3@agner.ch>
References: <cover.1458030082.git.maitysanchayan@gmail.com>
 <20160325074051.GB22398@peterchendt>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160325074051.GB22398@peterchendt>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Sanchayan Maity <maitysanchayan@gmail.com>, Peter.Chen@nxp.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, ivan.ivanov@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, shawnguo@kernel.org, marcel@ziswiler.com
List-Id: devicetree@vger.kernel.org

On 2016-03-25 00:40, Peter Chen wrote:
> On Tue, Mar 15, 2016 at 02:08:26PM +0530, Sanchayan Maity wrote:
>> Hello Peter,
>>
>> The existing usage of extcon in Chipidea driver relies on OTG
>> registers. In case of SoC with dual role device but not a true
>> OTG controller, this does not work. Such SoC's should specify
>> the existing CI_HDRC_DUAL_ROLE_NOT_OTG flag and do the role
>> switch without checking any of the OTG registers in my opinion.
>> This is the case for Vybrid which uses a Chipidea IP but does
>> not have a true 5 pin OTG implemented.
> 
> Sorry to reply you late due to my new born baby.
> 
> Are you sure Vybrid is NOT OTG core? Afaik, it is uses the same
> IP base with other Freescale SoCs, just the IP core is 2.40a.
> When working at device mode, can you read vbus status through
> OTGSC? And if there is an ID pin (input pin) for Vybrid? I mean
> SoC, not the board.

I think the IP is actually OTG capable, the registers are there, but the
signals seem not to be available on the SoC package. That is also what
the RM says...

Quotes from the RM:

"OTG controller should be treated as
Dual role controller that allows the
controller to act as either a Host or a
device with no support for HNP/SRP."

And later, in Chapter 11.1:

"The USB is not a true OTG. It can be configured by software to function
either as
peripheral or as host. The ID pin, which is unique for OTG operation, is
not present in
this implementation. There are no five pin interface. The user will get
four pin host/
device interface."
