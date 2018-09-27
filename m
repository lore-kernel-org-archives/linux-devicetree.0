From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2] of: __of_update_property_sysfs only call
 __of_sysfs_remove_bin_file if of_node_is_attached
Date: Wed, 26 Sep 2018 18:35:56 -0700
Message-ID: <a3374cea-32b7-92e8-21a3-8bc14ed5ee2e@gmail.com>
References: <AM6PR04MB52394FDB1266388BCE1374E3FC030@AM6PR04MB5239.eurprd04.prod.outlook.com>
 <c0bcc2c1-3058-db4d-ca4d-4e56c502891b@gmail.com>
 <DB7PR04MB5243B6ADEBCB4B53B5A161F8FC050@DB7PR04MB5243.eurprd04.prod.outlook.com>
 <CAL_JsqKc1-Rz6iBJ_dpDrEDoFRpTaLR+1voXdTgiJjjG65druA@mail.gmail.com>
 <DB7PR04MB52433D93A8536DC7F71E169AFC1A0@DB7PR04MB5243.eurprd04.prod.outlook.com>
 <20180926210537.GA3143@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926210537.GA3143@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Andre Kalb <Andre.Kalb@sma.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/26/18 14:05, Rob Herring wrote:
> On Thu, Sep 13, 2018 at 03:21:27PM +0000, Andre Kalb wrote:
>> Hi Rob,
>>
>> I have used an other hardware to check the patch. I hope it doesn’t matter. I added few lines at the untitest.c. All existing unittest use an attached sysfs, therefore the bug isn't detectable.
> 
> Okay, can you resend both patches in one series rather than pasted in 
> here.
> 
> Rob

I don't understand the need for the patch to __of_update_property_sysfs()
in the context of the current mainline Linux kernel.

As far as I know, there are no callers of of_update_property() against
a tree that is detached.  As such, the patch is adding complexity
without adding any functionality.

-Frank
