From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: of_mdio: Fix some endianness problems.
Date: Sat, 30 Oct 2010 22:54:03 -0400
Message-ID: <AANLkTi=24H4RNonXu=i3CHhYqbLniDya+BKnj_evw_p6@mail.gmail.com>
References: <1288227827-5447-1-git-send-email-ddaney@caviumnetworks.com>
	<20101030063237.GC2456@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101030063237.GC2456-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 30, 2010 at 2:32 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Wed, Oct 27, 2010 at 06:03:47PM -0700, David Daney wrote:
>> In of_mdiobus_register(), the __be32 *addr variable is dereferenced.
>> This will not work on little-endian targets. =A0Also since it is
>> unsigned, checking for less than zero is redundant.
>>
>> Fix these two issues.
>>
>> Signed-off-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>> Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
>> ---
>> =A0drivers/of/of_mdio.c | =A0 23 ++++++++++++++---------
>> =A01 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
>> index 1fce00e..b370306 100644
>> --- a/drivers/of/of_mdio.c
>> +++ b/drivers/of/of_mdio.c
>> @@ -52,27 +52,32 @@ int of_mdiobus_register(struct mii_bus *mdio, struct=
 device_node *np)
>>
>> =A0 =A0 =A0 /* Loop over the child nodes and register a phy_device for e=
ach one */
>> =A0 =A0 =A0 for_each_child_of_node(np, child) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 const __be32 *addr;
>> + =A0 =A0 =A0 =A0 =A0 =A0 const __be32 *paddr;
>> + =A0 =A0 =A0 =A0 =A0 =A0 u32 addr;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 int len;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* A PHY must have a reg property in the ran=
ge [0-31] */
>> - =A0 =A0 =A0 =A0 =A0 =A0 addr =3D of_get_property(child, "reg", &len);
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (!addr || len < sizeof(*addr) || *addr >=3D=
 32 || *addr < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 paddr =3D of_get_property(child, "reg", &len);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!paddr || len < sizeof(*paddr)) {
>> +addr_err:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&mdio->dev, "%s has =
invalid PHY address\n",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 child->full_=
name);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 addr =3D be32_to_cpup(paddr);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (addr >=3D 32)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto addr_err;
>
> goto's are fine for jumping to the end of a function to unwind
> allocations, but please don't use it in this manner. =A0The original
> structure will actually work just fine if you do it thusly:
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!paddr || len < sizeof(*paddr) ||
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*(addr =3D be32_to_cpup(paddr)) >=
=3D 32) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&mdio->dev, "%s ha=
s invalid PHY address\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0child->ful=
l_name);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> Otherwise this patch looks good. After you've reworked and retested
> I'll pick it up for 2.6.37 (or dave will).

Actually, I mistyped this.  I think it should be:

               if (!paddr || len < sizeof(*paddr) ||
                   (addr =3D be32_to_cpup(paddr)) >=3D 32) {
                       dev_err(&mdio->dev, "%s has invalid PHY address\n",
                               child->full_name);
                       continue;
               }

g.
