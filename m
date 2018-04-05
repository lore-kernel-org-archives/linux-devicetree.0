From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 2/5] of: change overlay apply input data from
 unflattened to FDT
Date: Thu, 5 Apr 2018 16:12:18 -0500
Message-ID: <CAL_Jsq+MmUTMrd+jNqUB2=A-q3cCy7+QWOKG0iF6zM0hjCy3PQ@mail.gmail.com>
References: <1520122673-11003-1-git-send-email-frowand.list@gmail.com>
 <1520122673-11003-3-git-send-email-frowand.list@gmail.com>
 <09e3db63-cbf9-52a2-ee77-520979f17fea@web.de> <7bbf615b-3cdd-6bb4-6918-33e48de4225d@gmail.com>
 <a21dbee8-6e4e-9ceb-c798-dda43c2eae2d@web.de> <d7e94a45-5d46-0491-e5dc-2b098a11c5b1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <jailhouse-dev+bncBDJIP47K7MERBSFCTLLAKGQEHOL6Y6A@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <d7e94a45-5d46-0491-e5dc-2b098a11c5b1@gmail.com>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Jan Kiszka <jan.kiszka@web.de>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jailhouse <jailhouse-dev@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 5, 2018 at 2:28 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 04/05/18 12:13, Jan Kiszka wrote:
>> On 2018-04-05 20:59, Frank Rowand wrote:
>>> Hi Jan,
>>>
>>> On 04/04/18 15:35, Jan Kiszka wrote:
>>>> Hi Frank,
>>>>
>>>> On 2018-03-04 01:17, frowand.list@gmail.com wrote:
>>>>> From: Frank Rowand <frank.rowand@sony.com>
>>>>>
>>>>> Move duplicating and unflattening of an overlay flattened devicetree
>>>>> (FDT) into the overlay application code.  To accomplish this,
>>>>> of_overlay_apply() is replaced by of_overlay_fdt_apply().
>>>>>
>>>>> The copy of the FDT (aka "duplicate FDT") now belongs to devicetree
>>>>> code, which is thus responsible for freeing the duplicate FDT.  The
>>>>> caller of of_overlay_fdt_apply() remains responsible for freeing the
>>>>> original FDT.
>>>>>
>>>>> The unflattened devicetree now belongs to devicetree code, which is
>>>>> thus responsible for freeing the unflattened devicetree.
>>>>>
>>>>> These ownership changes prevent early freeing of the duplicated FDT
>>>>> or the unflattened devicetree, which could result in use after free
>>>>> errors.
>>>>>
>>>>> of_overlay_fdt_apply() is a private function for the anticipated
>>>>> overlay loader.
>>>>
>>>> We are using of_fdt_unflatten_tree + of_overlay_apply in the
>>>> (out-of-tree) Jailhouse loader driver in order to register a virtual
>>>> device during hypervisor activation with Linux. The DT overlay is
>>>> created from a a template but modified prior to application to account
>>>> for runtime-specific parameters. See [1] for the current implementation.
>>>>
>>>> I'm now wondering how to model that scenario best with the new API.
>>>> Given that the loader lost ownership of the unflattened tree but the
>>>> modification API exist only for the that DT state, I'm not yet seeing a
>>>> clear solution. Should we apply the template in disabled form (status =
>>>> "disabled"), modify it, and then activate it while it is already applied?
>>>
>>> Thank you for the pointer to the driver - that makes it much easier to
>>> understand the use case and consider solutions.
>>>
>>> If you can make the changes directly on the FDT instead of on the
>>> expanded devicetree, then you could move to the new API.
>>
>> Are there some examples/references on how to edit FDTs in-place in the
>> kernel? I'd like to avoid writing the n-th FDT parser/generator.
>
> I don't know of any existing in-kernel edits of the FDT (but they might
> exist).  The functions to access an FDT are in libfdt, which is in
> scripts/dtc/libfdt/.

Let's please not go down that route of doing FDT modifications. There
is little reason to other than for early boot changes. And it is much
easier to work on unflattened trees.

Rob
