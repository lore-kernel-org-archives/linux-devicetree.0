From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] of/flattree: Eliminate need to provide
	early_init_dt_scan_chosen_arch
Date: Thu, 14 Oct 2010 22:53:53 -0600
Message-ID: <AANLkTik0mqV08ptsj9CXQxT_Ew2K479-V5r2DUdUXJv9@mail.gmail.com>
References: <20101013064352.2743.80378.stgit@localhost6.localdomain6>
	<4CB7713C.9040303@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CB7713C.9040303-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 14, 2010 at 3:08 PM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wr=
ote:
> On 10/12/2010 11:44 PM, Grant Likely wrote:
>>
>> This patch refactors the early init parsing of the chosen node so that
>> architectures aren't forced to provide an empty implementation of
>> early_init_dt_scan_chosen_arch. =A0Instead, if an architecture wants to
>> do something different, it can either use a wrapper function around
>> early_init_dt_scan_chosen(), or it can replace it altogether.
>>
>> This patch was written in preparation to adding device tree support to
>> both x86 ad MIPS.
>>
>> Signed-off-by: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> In conjunction with my 'MIPS: Add some irq definitins required by OF' and
> the '2/2 of/mips: Add device tree support to MIPS' patches, I can enable
> CONFIG_USE_OF, and build and run a kernel on my Octeon. =A0I haven't star=
ted
> using the device tree yet, but this is a good start.
>
> You can add my...
>
> Tested-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>

Thanks David.  I'll add your tags.

What do you think Ralf?  Should I merge these two patches up for
2.6.37?  As mentioned on my other reply, David's "MIPS: add some irq
definitions required by OF" patch isn't needed in my current
next-devicetree branch.

g.

>
>
>> ---
>> =A0arch/microblaze/kernel/prom.c | =A0 =A05 -----
>> =A0arch/powerpc/kernel/prom.c =A0 =A0| =A0 12 ++++++++++--
>> =A0drivers/of/fdt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 --
>> =A0include/linux/of_fdt.h =A0 =A0 =A0 =A0| =A0 =A02 +-
>> =A04 files changed, 11 insertions(+), 10 deletions(-)
>
> [...]
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
