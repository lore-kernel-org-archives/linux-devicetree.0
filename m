From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: How delete node or property in overlayd dts?
Date: Tue, 14 Aug 2018 18:26:25 -0700
Message-ID: <c342562e-f915-a853-c2a8-eecefd94b88d@gmail.com>
References: <CADUUTHBZ---U7YNYYry7qJY=vt_QpXpytymqJQc9xLFE_NjsAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CADUUTHBZ---U7YNYYry7qJY=vt_QpXpytymqJQc9xLFE_NjsAg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?5byg5rOi?= <zbsdta@gmail.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/14/18 07:46, 张波 wrote:
> /delete-node/ /delete-prop/ could be used in dtsi files without device
> tree overlay.
> 
> but with device tree overlay,  /delete-node/ and  /delete-prop/ are not work.
> How to delete property and node in overlay dts?
> 
> for example,
> in basel.dts have following node
> node1 {
>     property1;
>     property3;
>     node2 {
>         property2;
>     }
> }
> 
> in overlay.dts as following
>  node1 {
>     /delete-property/ property1;
>     /delete-node/ node2;
> }
> 
> after overlay, property1 and node2 is not deleted.
> 

The /delete-node/ and /delete-prop/ directives are only used by the
dtc compiler within a single compilation.

There is nothing in the format of a devicetree blob to represent the
notion of deleting a property or a node.

You can not delete a property or a node in an overlay dtb.
