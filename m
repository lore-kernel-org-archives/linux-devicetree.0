From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/3] RFC: Check offset in fdt_string()
Date: Wed, 27 Feb 2013 16:42:48 -0800
Message-ID: <CAPnjgZ3QmSbeJtn4aD5XAs87a5b_ijFcjHAPjO8tOUi8KOszrg@mail.gmail.com>
References: <1360968578-18443-1-git-send-email-sjg@chromium.org>
 <1360968578-18443-4-git-send-email-sjg@chromium.org>
 <20130221233503.GH21011@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130221233503.GH21011-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Thu, Feb 21, 2013 at 3:35 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Feb 15, 2013 at 02:49:38PM -0800, Simon Glass wrote:
>> (We probably don't want this patch, and certainly can't apply it as is,
>> but I send it in order to find out the intent of fdt_string()).
>>
>> At present fdt_string() says that returns:
>>
>>    - a pointer to the string, on success
>>    - NULL, if stroffset is out of bounds
>>
>> However it does not in fact return NULL. Changing it to do so also
>> breaks 15 tests (segfault).
>>
>> What is the intended behaviour of this function, please?
>
> Ah.  Yes.  So I'm guessing the tests that fail are all the tests of
> the sequential write functions (fdt_sw.c).  When the blob is in
> sequential write mode, the string offsets work differently - they're
> negative from a strings block pointer which sits at the end of the
> strings.  That's because as we add new properties, the strings block
> grows downwards.  The offsets get fixed up again in fdt_finish().
>
> So, fdt_string() would need a special case for trees in SW mode.  I
> also have a vague recollection that there was another reason I didn't
> implement the bounds checking, but I seem to have forgotton what it
> was :(.

OK, let's not worry about it for now - this patch should not be applied.

If you think we should / could take particular action, please let me
know and I can perhaps prepare a patch.

Regards,
Simon

>
>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes in v2:
>> - Drop patch to replace fdtdump
>>
>>  libfdt/fdt_ro.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
>> index 50007f6..cba8772 100644
>> --- a/libfdt/fdt_ro.c
>> +++ b/libfdt/fdt_ro.c
>> @@ -77,6 +77,8 @@ static int _fdt_nodename_eq(const void *fdt, int offset,
>>
>>  const char *fdt_string(const void *fdt, int stroffset)
>>  {
>> +     if (stroffset < 0 || stroffset >= fdt_size_dt_strings(fdt))
>> +             return NULL;
>>       return (const char *)fdt + fdt_off_dt_strings(fdt) + stroffset;
>>  }
>>
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
