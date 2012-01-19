From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 2/7] fdt: Add function to allow aliases to
 refer to multiple nodes
Date: Thu, 19 Jan 2012 15:45:29 -0800
Message-ID: <CAPnjgZ3c6POmEoNRiz+wX8YGVzAtUyzzjXyaz9W9wepLsByoGw@mail.gmail.com>
References: <1326394818-32227-1-git-send-email-sjg@chromium.org>
	<1326394818-32227-3-git-send-email-sjg@chromium.org>
	<4F1881BD.2050704@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F1881BD.2050704@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Thu, Jan 19, 2012 at 12:49 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/12/2012 12:00 PM, Simon Glass wrote:
>> Some devices can deal with multiple compatible properties. The devices
>> need to know which nodes to bind to which features. For example an
>> I2C driver which supports two different controller types will want to
>> know which type it is dealing with in each case.
>>
>> The new fdtdec_add_aliases_for_id() function deals with this by allowing
>> the driver to search for additional compatible nodes for a different ID.
>> It can then detect the new ones and perform appropriate processing.
>>
>> Another option considered was to return a tuple (node offset, compat id)
>> and have the function be passed a list of compatible IDs. This is more
>> overhead for the common case though. We may add such a function later if
>> more drivers in U-Boot require it.
>
>> +int fdtdec_add_aliases_for_id(const void *blob, const char *name,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum fdt_compat_id id, int *no=
de_list, int maxcount)
> ...
>> @@ -232,11 +238,13 @@ int fdtdec_find_aliases_for_id(const void *blob, c=
onst char *name,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* it as done.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fdtdec_get_is_enabled(blob, node)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (node_list[number])
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 node_list[number] =3D node;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (number >=3D num_found)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num_found =
=3D number + 1;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 =A0 =A0 =A0 =A0 nodes[j] =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nodes[found] =3D 0;
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 /* Add any nodes not mentioned by an alias */
>
> Aren't those two changes really bug-fixes to the underlying patch rather
> than part of this enhancement?

Clean-ups maybe. The first change can change behaviour when someone
has two aliases the same. The second is equivalent (j =3D=3D found) but
nicer I think.

>
> I'm not convinced this patch is correct in all cases. It'll probably
> work fine for simply device-trees though. Consider the following case:
>
> 4 device nodes
> A: compat=3Di2c alias for usb0
> B: compat=3Di2c no alias
> C: compat=3Di2c alias for usb2
> D: compat=3Di2cx alias for usb1
>
> First, we search for all compat=3Di2c, the list comes back:
>
> 0=3DA
> 1=3DB
> 2=3DC
>
> Then we search for all compat=3Di2cx, the list comes back:
>
> -1
> -1
> -1
> D
>
> So D's alias of 1 isn't honored even though if both IDs were searched
> for together, it would have been.

Do we really want that behaviour? Overall I think it is a bit odd to
have devices with no aliases if you actually care about the ordering.
At least in U-Boot ordering is important. The simple fix above is to
provide an alias for everything, which is what we do. If we do want
the behaviour you suggest then I will need the change to doing it in
one pass.

>
> Also, what about the scenario where a driver searches for both
> nvidia,tegra20-i2c then later nvidia,tegra30-i2c, given that all the DT
> nodes are probably compatible with both?

If all DT notes are compatible with both, why are you searching for
one and then the other? Why not just search for one?

It sounds like a decision here as to whether we want a one-pass
algorithm with a list of compatible nodes, or the current additive
priorty-based approach.

Regards,
Simon

>
> --
> nvpublic
