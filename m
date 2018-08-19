From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: How delete node or property in overlayd dts?
Date: Sat, 18 Aug 2018 23:12:49 -0700
Message-ID: <d554d6aa-1301-9bf4-482b-8d8f2bb37f93@gmail.com>
References: <CADUUTHBZ---U7YNYYry7qJY=vt_QpXpytymqJQc9xLFE_NjsAg@mail.gmail.com>
 <c342562e-f915-a853-c2a8-eecefd94b88d@gmail.com>
 <CAL_JsqLV5d5cL3o3Dx=--zGD37c5O09rL9AXyRFmceTfBHt3Zg@mail.gmail.com>
 <78f06f2d-7561-dde9-c155-9f1612f9067a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78f06f2d-7561-dde9-c155-9f1612f9067a@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Bo <zbsdta@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/18/18 03:38, Zhang Bo wrote:
> 
> 在 2018/8/18 1:47, Rob Herring 写道:
>> On Tue, Aug 14, 2018 at 7:26 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>> On 08/14/18 07:46, 张波 wrote:
>>>> /delete-node/ /delete-prop/ could be used in dtsi files without device
>>>> tree overlay.
>>>>
>>>> but with device tree overlay,  /delete-node/ and  /delete-prop/ are not work.
>>>> How to delete property and node in overlay dts?
>>>>
>>>> for example,
>>>> in basel.dts have following node
>>>> node1 {
>>>>      property1;
>>>>      property3;
>>>>      node2 {
>>>>          property2;
>>>>      }
>>>> }
>>>>
>>>> in overlay.dts as following
>>>>   node1 {
>>>>      /delete-property/ property1;
>>>>      /delete-node/ node2;
>>>> }
>>>>
>>>> after overlay, property1 and node2 is not deleted.
>>>>
>>> The /delete-node/ and /delete-prop/ directives are only used by the
>>> dtc compiler within a single compilation.
>>>
>>> There is nothing in the format of a devicetree blob to represent the
>>> notion of deleting a property or a node.
>>>
>>> You can not delete a property or a node in an overlay dtb.
>> Though you can add/override 'status' with 'status = "disabled";' which
>> should be treated very similar to a node not being present. I say
>> similar because it's a source of bugs for the OS to fail to pay
>> attention to status property.
> 
> there is document in https://android.googlesource.com/kernel/msm/+/android-7.0.0_r0.11/Documentation/devicetree/overlay-notes.txt> 
> In above document, remove node or property by adding - operator before node or property. but I didn't find it in released kernel source code, Is there any update plan about this problem?
> 
> {
> 
>     property-a;       /* add property-a to the target */
> 
>     -proptery-b;     /* remove property-b from the target */
> 
>     -node-b {          /* remove an exiting node-b */
> 
>         ...
> 
>     }
> 
> }
> 
> 

As far as I can tell, this version of overlay-notes.txt has never been
in the mainline kernel source.

There is no plan to support such a syntax.

-Frank
