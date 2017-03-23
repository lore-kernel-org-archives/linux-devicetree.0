From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: Query on DT overlay support.
Date: Thu, 23 Mar 2017 12:02:25 -0700
Message-ID: <58D41BC1.9070203@gmail.com>
References: <C89496FEAE474D468F30D558A9468D9F26D7986C@XAP-PVEXMBX01.xlnx.xilinx.com>
 <CAL_JsqL97FvXKc4ZjG5B28tpe=9CvvSY9+zgE7iN8moOz2OHVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL97FvXKc4ZjG5B28tpe=9CvvSY9+zgE7iN8moOz2OHVQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Nava kishore Manne <nava.manne@xilinx.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srinivas Goud <sgoud@xilinx.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

(Adding Pantelis and dgibson to cc.)

On 03/23/17 11:32, Rob Herring wrote:
> On Thu, Mar 23, 2017 at 8:22 AM, Nava kishore Manne
> <nava.manne@xilinx.com> wrote:
>> Hi,
>>
>>
>>
>>                 This mail is regarding the DT overlay support in the Linux
>> kernel
>>
>>                 I am able to make the device-tree overlay work out of box by
>> using my own dtc complier (I mean I used the dtc compiler
>>
>>                 Available here
>> http://www.embedded-things.com/bbb/patching-the-device-tree-compiler-for-ubuntu/
>> )
>>
>>                 When can I expect the same changes in the scripts/dtc in
>> mainline????
>>
>>                 In case of any support needed for testing I can help on
>> testing the same I works in Xilinx and we had a lot of combinations to test
>> overlay J
> 
> It's already there. Landed in 4.11.
> 
> Rob
> 

One dtc feature that is still missing is what Pantelis calls "syntatic sugar".
His patch for that has not yet been accepted into the dtc project if I have
been following along correctly.

Without the syntactic sugar, the source .dts has to expose the details
of the fragment and __overlay__ nodes.

-Frank
