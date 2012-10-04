From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] dtc: fix for_each_*() to skip first object if deleted
Date: Thu, 04 Oct 2012 12:05:43 -0600
Message-ID: <506DCFF7.9080304@wwwdotorg.org>
References: <1349303574-4635-1-git-send-email-swarren@wwwdotorg.org>
 <506CCD68.4030000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <506CCD68.4030000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/03/2012 05:42 PM, Rob Herring wrote:
> On 10/03/2012 05:32 PM, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The previous definition of e.g. for_each_*() would always include the
>> very first object within the list of processed labels, irrespective of
>> whether it was marked deleted, since the deleted flag was not checked
>> on the first object, but only on any "next" object.
>>
>> Fix for_each_*() to call skip_deleted_*() prior to every loop iteration,
>> including the first, i.e. as part of the for loop test expression rather
>> than as part of the increment statement, to correct this.
>>
>> Incidentally, this change is why commit 45013d8 dtc: "Add ability to
>> delete nodes and properties" only caused two "make checkm" failures;
>> only two tests actually use multiple labels on the same property or
>> node. With this current change applied, but commit 317a5d9 "dtc: zero
>> out new label objects" reverted, "make checkm" fails 29 times; i.e.
>> for every test that uses any labels at all.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Rob, Grant, now that you're listed as maintainers for the Linux kernel's
>> copy of dtc, will you automatically apply patches there as they are
>> accepted into upstream dtc, or should I still create "backport" patches
>> and send them to you separately?
> 
> I guess the fundamental question is when do we sync upstream dtc:
...
> Assuming we go with pick-up all the dtc changes every kernel cycle, it
> should be simple enough to script picking up commits from upstream. I'm
> assuming it is just a path fix-up? In that case, it wouldn't be
> necessary to post both versions of patches. Now, if someone wants to do
> that script and just provide me a git branch to pull, I would be more
> than happy to take it.

There are a couple of things that make scripting this slightly non-trivial:

a) The kernel has its own Makefile, so when Makefile.dtc is changed, the
kernel's Makefile needs equivalent changes.

I guess a script could just check for Makefile edits, and flag the
commit as needing manual fixup later or something.

b) The kernel doesn't run flex/bison, but rather relies on having
checked-in copies of their output with "_shipped" names.

I guess this wouldn't be too hard to automate.

c) And of course, some files don't get checked into the kernel (e.g.
tests/), but that and the path change should be easy to handle.
