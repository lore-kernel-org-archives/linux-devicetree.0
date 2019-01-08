From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: Consistent capitalization of "device tree"?
Date: Mon, 7 Jan 2019 17:09:40 -0800
Message-ID: <4d4cf1b1-0966-305d-9bf3-e9dc84d6e8c6@gmail.com>
References: <20190107183711.GA5671@amd>
 <CAL_JsqKzs4WoJoe_uCzhS3NBGfHiTQ96GkfSRhtxeah0THoVyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKzs4WoJoe_uCzhS3NBGfHiTQ96GkfSRhtxeah0THoVyw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 1/7/19 10:45 AM, Rob Herring wrote:
> On Mon, Jan 7, 2019 at 12:37 PM Pavel Machek <pavel@ucw.cz> wrote:
>>
>> Is it "Device Tree" or "device tree"?
>>
>>  pavel@duo:/data/l/k/Documentation$ grep -r "Device Tree"  | wc -l
>>  235
>>  pavel@duo:/data/l/k/Documentation$ grep -r "device tree"  | wc -l
>>  595
>>
>> I guess it would be nice to make it consistent. I guess "device tree"
>> is preffered?
> 
> Well, the spec uses "devicetree" with capital 'D' as needed (titles
> and start of sentences). I didn't check if we're 100% consistent
> there.

For reference, the specification is at:

https://www.devicetree.org/specifications/


> 
>> Should we do something like this?
> 
> I'll take patches, but it wouldn't be at the top of my list.
> 
> Rob
> 
