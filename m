From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] drivercore: Add of_match_table to the common device drivers
Date: Sun, 7 Mar 2010 00:19:47 -0700
Message-ID: <fa686aa41003062319t33227670x1f0616cff887733b@mail.gmail.com>
References: <20100307064111.1442.63478.stgit@angua>
	<20100307180744.956998c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100307180744.956998c5.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kay.sievers-tD+1rO4QERM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 7, 2010 at 12:07 AM, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wr=
ote:
> Hi Grant,
>
> Just a quick note:
>
> On Sat, 06 Mar 2010 23:47:00 -0700 Grant Likely <grant.likely@secretlab.c=
a> wrote:
>>
>> diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_as=
ic.c
>> index 67fe13f..a5806ab 100644
>> --- a/drivers/macintosh/macio_asic.c
>> +++ b/drivers/macintosh/macio_asic.c
>> @@ -40,8 +40,7 @@ static struct macio_chip =A0 =A0 =A0*macio_on_hold;
>> =A0static int macio_bus_match(struct device *dev, struct device_driver *=
drv)
>> =A0{
>> =A0 =A0 =A0 struct macio_dev * macio_dev =3D to_macio_device(dev);
>> - =A0 =A0 struct macio_driver * macio_drv =3D to_macio_driver(drv);
>> - =A0 =A0 const struct of_device_id * matches =3D macio_drv->match_table;
>> + =A0 =A0 const struct of_device_id * matches =3D drv->match_table;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^^^^^^^^
> of_match_table

Heh.  Oops.  I fixed that in my local directory when compile testing,
but neglected to refresh the patch.

Thanks,
g.
