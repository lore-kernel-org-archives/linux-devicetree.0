From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: Consistent capitalization of "device tree"?
Date: Mon, 7 Jan 2019 20:49:32 -0800
Message-ID: <64534368-1ee5-3a6b-18a6-d1d527aa4bdd@gmail.com>
References: <20190107183711.GA5671@amd>
 <91bc4723-8e3a-4ed6-5104-36a614d6a6d2@gmail.com> <20190107192458.GG933@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107192458.GG933@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, corbet@lwn.net, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 1/7/19 11:24 AM, Pavel Machek wrote:
> On Mon 2019-01-07 11:06:27, Frank Rowand wrote:
>>
>> + Frank
>>
>> On 1/7/19 10:37 AM, Pavel Machek wrote:
>>> Is it "Device Tree" or "device tree"?
>>>     
>>>  pavel@duo:/data/l/k/Documentation$ grep -r "Device Tree"  | wc -l
>>>  235
>>>  pavel@duo:/data/l/k/Documentation$ grep -r "device tree"  | wc -l
>>>  595
>>>     
>>> I guess it would be nice to make it consistent. I guess "device tree"
>>> is preffered?
>>>
>>> Should we do something like this?
>>> 								Pavel
>>>
>>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>>     
>>> diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
>>> index 725fb8d..cc5f507 100644
>>> --- a/Documentation/devicetree/overlay-notes.txt
>>> +++ b/Documentation/devicetree/overlay-notes.txt
>>> @@ -8,7 +8,7 @@ companion document to Documentation/devicetree/dynamic-resolution-notes.txt[1]
>>>  How overlays work
>>>  -----------------
>>>  
>>> -A Device Tree's overlay purpose is to modify the kernel's live tree, and
>>> +A device tree's overlay purpose is to modify the kernel's live tree, and
>>>  have the modification affecting the state of the kernel in a way that
>>>  is reflecting the changes.
>>>  Since the kernel mainly deals with devices, any new device node that result
>>>
>>
>> Not a strong opinion, but I would prefer a third option of devicetree.  That
>> makes it much easier to search for.
> 
> That one is much less popular at the moment -- according to my
> searches... so it would be a bigger change.
> 
> (Which I'll gladly support if I won't have to do the work... as long
> as it is consistent. But I believe that "device tree" is most common
> here, makes sense, and is easiest change, so...)
> 
> 								Pavel

After finding the rest of the thread, and thinking further, I don't think
the easiest change is the correct change.  Ease of search is much more
than just grep of the kernel source, it is also web search engines.  I
think that the extra effort of "devicetree" is worth while in the long
run.  But I don't see a need to do an immediate global change - it can
happen either slowly over time or quickly as people choose to submit
patches.

-Frank
