From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] of: __of_update_property_sysfs only call
 __of_sysfs_remove_bin_file if of_node_is_attached
Date: Wed, 26 Sep 2018 16:05:37 -0500
Message-ID: <20180926210537.GA3143@bogus>
References: <AM6PR04MB52394FDB1266388BCE1374E3FC030@AM6PR04MB5239.eurprd04.prod.outlook.com>
 <c0bcc2c1-3058-db4d-ca4d-4e56c502891b@gmail.com>
 <DB7PR04MB5243B6ADEBCB4B53B5A161F8FC050@DB7PR04MB5243.eurprd04.prod.outlook.com>
 <CAL_JsqKc1-Rz6iBJ_dpDrEDoFRpTaLR+1voXdTgiJjjG65druA@mail.gmail.com>
 <DB7PR04MB52433D93A8536DC7F71E169AFC1A0@DB7PR04MB5243.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB7PR04MB52433D93A8536DC7F71E169AFC1A0@DB7PR04MB5243.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Kalb <Andre.Kalb@sma.de>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 13, 2018 at 03:21:27PM +0000, Andre Kalb wrote:
> Hi Rob,
> 
> I have used an other hardware to check the patch. I hope it doesn’t matter. I added few lines at the untitest.c. All existing unittest use an attached sysfs, therefore the bug isn't detectable.

Okay, can you resend both patches in one series rather than pasted in 
here.

Rob
