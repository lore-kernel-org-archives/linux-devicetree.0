From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v7 2/5] of: change overlay apply input data from
 unflattened to FDT
Date: Thu, 5 Apr 2018 12:16:52 -0700
Message-ID: <69c06530-94df-b67b-4e56-6519275afb45@gmail.com>
References: <1520122673-11003-1-git-send-email-frowand.list@gmail.com>
 <1520122673-11003-3-git-send-email-frowand.list@gmail.com>
 <09e3db63-cbf9-52a2-ee77-520979f17fea@web.de>
 <CAL_Jsq+Gu=gwcxJnOF2xybXCh9N2Fp1NV05kuvQ2rif1fdHYrA@mail.gmail.com>
 <935d6135-c5db-e5f8-b850-8ef26ce0c0a0@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <jailhouse-dev+bncBD3LJZVFUEJBBJXMTHLAKGQEZLQK2EQ@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <935d6135-c5db-e5f8-b850-8ef26ce0c0a0@web.de>
Content-Language: en-US
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Jan Kiszka <jan.kiszka@web.de>, Rob Herring <robh+dt@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jailhouse <jailhouse-dev@googlegroups.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 04/05/18 00:22, Jan Kiszka wrote:
> On 2018-04-05 02:55, Rob Herring wrote:
>> On Wed, Apr 4, 2018 at 5:35 PM, Jan Kiszka <jan.kiszka@web.de> wrote:
>>> Hi Frank,
>>>
>>> On 2018-03-04 01:17, frowand.list@gmail.com wrote:
>>>> From: Frank Rowand <frank.rowand@sony.com>
>>>>
>>>> Move duplicating and unflattening of an overlay flattened devicetree
>>>> (FDT) into the overlay application code.  To accomplish this,
>>>> of_overlay_apply() is replaced by of_overlay_fdt_apply().
>>>>
>>>> The copy of the FDT (aka "duplicate FDT") now belongs to devicetree
>>>> code, which is thus responsible for freeing the duplicate FDT.  The
>>>> caller of of_overlay_fdt_apply() remains responsible for freeing the
>>>> original FDT.
>>>>
>>>> The unflattened devicetree now belongs to devicetree code, which is
>>>> thus responsible for freeing the unflattened devicetree.
>>>>
>>>> These ownership changes prevent early freeing of the duplicated FDT
>>>> or the unflattened devicetree, which could result in use after free
>>>> errors.
>>>>
>>>> of_overlay_fdt_apply() is a private function for the anticipated
>>>> overlay loader.
>>>
>>> We are using of_fdt_unflatten_tree + of_overlay_apply in the
>>> (out-of-tree) Jailhouse loader driver in order to register a virtual
>>> device during hypervisor activation with Linux. The DT overlay is
>>> created from a a template but modified prior to application to account
>>> for runtime-specific parameters. See [1] for the current implementation.
>>>
>>> I'm now wondering how to model that scenario best with the new API.
>>> Given that the loader lost ownership of the unflattened tree but the
>>> modification API exist only for the that DT state, I'm not yet seeing a
>>> clear solution. Should we apply the template in disabled form (status =
>>> "disabled"), modify it, and then activate it while it is already applied?
>>
>> No. I don't think that will work.
>>
>> The of_overlay_apply() function is still there, but static. We can
>> export it again if the need arises.
> 
> That would be the simplest solution from our perspective, but I'm not
> sure if that is in the original spirit of this change.

For short term out of tree usage, exporting of_overlay_apply() is ok.

Yes, for in-tree, exporting it again defeats the attempted process to
solve the overlay issues to make them acceptable in main line.


>>
>> Another option is there is a notifier callback OF_OVERLAY_PRE_APPLY,
>> but I'm not sure we want to make that be the normal interface to make
>> modifications.
> 
> And would calling modification functions from that callback be legal at all?

It might work in some specific cases, but the result is undefined.


> 
> Jan
> 
