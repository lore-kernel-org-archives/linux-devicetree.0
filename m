From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: how to structure some disruptive patches
Date: Tue, 2 Aug 2016 15:51:20 -0700
Message-ID: <57A123E8.3070109@gmail.com>
References: <57A0D84C.9000605@gmail.com>
 <CAL_JsqJ4QQ9HjHZYp-jgODTiu-BHiyo2ZV5u9ysBr-oL1xbF_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ4QQ9HjHZYp-jgODTiu-BHiyo2ZV5u9ysBr-oL1xbF_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/02/16 11:53, Rob Herring wrote:
> On Tue, Aug 2, 2016 at 12:28 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Rob,
>>
>> I've been working on cleaning up the docbook function documentation
>> in the device tree files.  The resulting patches could interfere with
>> code patches, so I want to figure out how to structure the documentation
>> patches to avoid that.  I would like your opinion and suggestions on
>> the subject.
>>
>> First premise: this set of documentation changes is a second class
>> citizen compared to code changes.  Any patch from this set can be
>> dropped any time it interferes with a code patch.
>>
>> I started the project with the simple intent of fixing what was
>> clearly broken.
>>   - fix syntax errors
>>   - fix mismatches between actual function arguments vs docbook
>>     list of function arguments
>>   - fix mismatches between function return type (void vs anything) and
>>     values vs docbook return types and values
>>   - fix factually incorrect descriptions of what the function does
>>
>> When I was making those changes, I found also found documentation
>> that was somewhat cryptic or otherwise hard to understand.  I also
>> found that the description of the same item was described in a
>> wide variety of ways in different docbook headers.  I made an
>> effort to also clean that up.
>>
>> The result was a large patch series (that was not totally complete):
>>
>>    15 files changed, 1414 insertions(+), 730 deletions(-)
> 
> All in drivers/of and related headers?

Yes.  Plus a line in the docbook makefile and a small docbook
file that specifies which source files to process.


> 
>> plus around 150 lines of change to docbook files so that
>> the device tree man pages would be created.  I did not
>> add any other significant docbook documentation of device tree.
>>
>> There are at least a couple of approaches I could take for
>> submitting patches (and would be glad to hear of any other
>> approach that I did not think of):
>>
>> 1) The big ugly patchset referenced above, one patch per
>>    file.
>>      pro: exposes what changes were made to each function
>>           documentation header
>>      con: very dense and not very readable
>>      con: the mechanical corrections create a lot of noise if
>>           the reviewer wants to view actual content changes
>>      con: probably more likely to conflict with code patches
>>           in a way that is not easily fixed
> 
> This is fine with me. Let's not over complicate things. There aren't
> that many changes typically in a cycle, so we can deal with it. I'd
> expect most changes would not collide as docbook comments and code
> changes are separated somewhat.

Thanks, I like less complication in my life. :-)

> 
> I'd like a git branch for this. I'll keep it separate until -rc6 or so
> and then you can rebase things then if merging becomes a problem. Or
> we can drop any problematic patches.

Sounds like a good plan.  I will send the patches to the mail list
for review as well as keep a git branch.

> 
>> 2) Split method 1 into stages (one patch per file for each stage).
>>    Examples of some possible stages are:
>>    - white space fixes
>>    - syntax fixes
>>    - incorrect argument list fixes
>>    - incorrect return type fixes
>>    - incorrect return value fixes
>>    - incorrect behavior description fixes
>>    - confusing behavior description fixes
>>      pro: it would be easier to review patches for many of the stages
>>      con: a lot more patches
>>      con: maybe difficult to handle conflicts with code patches
>>      con: maybe difficult to rework patches for review comments (changes
>>           for an earlier stage are likely to impact a patch for a later
>>           stage)
>>
>> 3) Do one patch series to remove all docbook function header documentation.
>>    Do a second patch series to add the updated docbook function header
>>    documentation.  For each of the two series, one patch per file.
>>      pro: the patches are much easier to read
>>      pro: it might be easier to resolve conflicts with source patches
>>           (either you dropping a few hunks or me redoing the docbook patch
>>           to remove the conflict)
>>      con: the actual changes to what the documentation says are not visible
>>
>> My current version of the patches is against 4.7-rc2.  I will have to update
>> this to 4.7 or 4.8-rc1 (I would assume that 4.8-rc1 would make more sense).
> 
> You've followed all the documentation changes for 4.8 using Sphinx,
> right? Is this going to impact your work?

I've been following at a distance for the last year.  The last I heard the intent
was to not change the syntax in the source files (though there was muttering
about possibly enhancing the syntax).  I have articles on Linux Sphinx open in a
browser, and will make sure I'm up to speed.  Worse case that I expect would
be if I have to make some sort of Sphinx file instead of a docbook file to
point to the source files containing the docbook headers.

> 
> Rob
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
