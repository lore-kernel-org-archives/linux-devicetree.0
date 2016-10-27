From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 13/13] of: Remove unused variable overlay_symbols
Date: Thu, 27 Oct 2016 09:57:56 -0700
Message-ID: <58123214.1090405@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
 <1477429146-27039-14-git-send-email-frowand.list@gmail.com>
 <27823D48-C6B1-486C-8460-9B3C33DDC62F@antoniou-consulting.com>
 <58122AF9.3040709@gmail.com> <58123122.8020908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58123122.8020908-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/27/16 09:53, Frank Rowand wrote:
> On 10/27/16 09:27, Frank Rowand wrote:
>> On 10/27/16 07:41, Pantelis Antoniou wrote:
>>> Hi Frank,
>>>
>>>
>>>> On Oct 25, 2016, at 23:59 , frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>>
>>>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>>>
>>>> This unused variable is a reminder that symbols in overlays are
>>>> not available to subsequent overlays.  If such a feature is
>>>> desired then there are several ways it could be implemented.
>>>>
>>>
>>> Please don’t apply that. There’s a patch that actually imports
>>> the symbol table from overlays that subsequent operations
>>> work.
>>>
>>> Please see:
>>>
>>> https://patchwork.kernel.org/patch/9104701/
>>
>> Thanks for the pointer!  When the import symbols patch is applied
>> then the comment in my patch header becomes incorrect.  I will
>> change the patch comment to act is if the import symbols patch
>> is in place.
>>
>> But the node pointer that my patch removes is still not used
>> for anything, even if the import symbols patch is applied.
>>
>> Am I missing something?
> 
> I was missing a later patch in the symbol import patch set that
> updated resolver.c to use the imported symbols.  I'll go look
> at that.

Crap.  I misread the file name in the patch that I thought was
updating resolver.c.  It was actually overlay.c.  So I am back
to my question of:

   Am I missing something?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
