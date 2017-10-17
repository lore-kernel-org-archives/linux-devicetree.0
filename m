From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/5] of/fdt: only store the device node basename in full_name
Date: Tue, 17 Oct 2017 16:46:27 -0500
Message-ID: <CABGGisxU2OPZz-rrWYZYgCQ0iGM9w5vL9Ob9BTHALFN8JyxeJQ@mail.gmail.com>
References: <20170821151651.25096-1-robh@kernel.org> <20170821151651.25096-6-robh@kernel.org>
 <CANk1AXTLT9gB_f0GZLODpppjkxqDAp1x1RZmQ8O1i+UHckimxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANk1AXTLT9gB_f0GZLODpppjkxqDAp1x1RZmQ8O1i+UHckimxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, David Laight <David.Laight@aculab.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 4:32 PM, Alan Tull <atull@kernel.org> wrote:
> On Mon, Aug 21, 2017 at 10:16 AM, Rob Herring <robh@kernel.org> wrote:
>
> Hi Rob,
>
>> With dependencies on a statically allocated full path name converted to
>> use %pOF format specifier, we can store just the basename of node, and
>> the unflattening of the FDT can be simplified.
>>
>> This commit will affect the remaining users of full_name. After
>> analyzing these users, the remaining cases should only change some print
>> messages. The main users of full_name are providing a name for struct
>> resource. The resource names shouldn't be important other than providing
>> /proc/iomem names.
>>
>> We no longer distinguish between pre and post 0x10 dtb formats as either
>> a full path or basename will work. However, less than 0x10 formats have
>> been broken since the conversion to use libfdt (and no one has cared).
>> The conversion of the unflattening code to be non-recursive also broke
>> pre 0x10 formats as the populate_node function would return 0 in that
>> case.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> v2:
>> - rebase to linux-next
>>
>>  drivers/of/fdt.c | 69 +++++++++-----------------------------------------------
>>  1 file changed, 11 insertions(+), 58 deletions(-)
>
> I've just updated to the latest next branch and am finding problems
> applying overlays.   Reverting this commit alleviates things.  The
> errors I get are:
>
> [   88.498704] OF: overlay: Failed to apply prop @/__symbols__/clk_0
> [   88.513447] OF: overlay: apply failed '/__symbols__'
> [   88.518423] create_overlay: Failed to create overlay (err=-12)

Frank's series with overlay updates should fix this.

Rob
