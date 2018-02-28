From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v4 1/2] of: cache phandle nodes to reduce cost of
 of_find_node_by_phandle()
Date: Wed, 28 Feb 2018 12:58:22 -0800
Message-ID: <9a078531-74ba-55f8-0dd1-961504b306b4@gmail.com>
References: <1519844656-16443-1-git-send-email-frowand.list@gmail.com>
 <1519844656-16443-2-git-send-email-frowand.list@gmail.com>
 <CAHp75VfD6Hi0NScdZrYozp9dAqmUUYjcLuPPyRwM31ezxNO2fw@mail.gmail.com>
 <c5d81c10-8b92-0a5d-93c2-8b8377b1396f@gmail.com>
 <CAHp75Vc4jbJqM0=Yy-1SY6E2WhzHOAAcrn1+KE-jT7MWPtWPpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc4jbJqM0=Yy-1SY6E2WhzHOAAcrn1+KE-jT7MWPtWPpA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, cpandya@codeaurora.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 02/28/18 12:19, Andy Shevchenko wrote:
> On Wed, Feb 28, 2018 at 9:44 PM, Frank Rowand <frowand.list@gmail.com> wrote:
>> On 02/28/18 11:31, Andy Shevchenko wrote:
>>> On Wed, Feb 28, 2018 at 9:04 PM,  <frowand.list@gmail.com> wrote:
> 
>>> The question is why O(1) is so important? O(log(n)) wouldn't work?
>>
>> O(1) is not critical.  It was just a nice side result.
>>
>>
>>> Using radix_tree() I suppose allows to dynamically extend or shrink
>>> the cache which would work with DT overlays.
>>
>> The memory usage of the phandle cache in this patch is fairly small.
>> The memory overhead of a radix_tree() would not be justified.
> 
> OTOH the advantage I mentioned isn't a good argument?

No.  Deleting and re-creating the cache to resize it (when applying an
overlay) would be a rare event that would happen as desired by the
overlay application code.  There is no real gain by having extension
or shrinkage occur automatically and if the overlay application code
desires the resizing it is trivial to implement (a single function
call).
