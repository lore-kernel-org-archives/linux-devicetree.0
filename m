From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] powerpc: pcm030/032: add pagesize to dts
Date: Mon, 15 Nov 2010 14:58:51 -0700
Message-ID: <AANLkTi=H_zONah7YuKSffkGrSiGa+7-LSbXE+qO=86Zj@mail.gmail.com>
References: <1289841916-3825-1-git-send-email-w.sang@pengutronix.de>
	<1289841916-3825-2-git-send-email-w.sang@pengutronix.de>
	<20101115173250.GA22104@oksana.dev.rtsoft.ru>
	<4CE1A0E4.5030505@firmworks.com>
	<20101115212432.GA17754@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101115212432.GA17754-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 15, 2010 at 2:24 PM, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> On Mon, Nov 15, 2010 at 11:06:44AM -1000, Mitch Bradley wrote:
> [...]
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eeprom@52 {
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D=
 "catalyst,24c32";
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D<0x52>;
>> >>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pagesize =3D<32>;
>> >
>> >I think you'd better drop the pagesize property altogether, and
>> >instead make the compatible string more specific (if needed at
>> >all. are there any 'catalyst,24c32' chips with pagesize !=3D 32?)
>>
>> Microchip makes a 24c32 part that looks pretty similar to the
>> catalyst part, but Microchip's has a 64-byte page size compared to
>> Catalyst's 32.
>
> Well, when using microchip part, the compatible string would be
> "microchip,24c32", correct? Then we have all the information
> already, no need for the pagesize.
>
>> It would probably be feasible to have a generic I2C EEPROM driver
>> that could handle many different parts, parameterized by total size,
>> block size, and page size.

The current at24.c driver is already parameterized; but part of the
parameter data is statically linked into the board support code.

>
> I guess it can do this already via I2C ID table. The problem
> is that I2C core is only using part ID (no vendor ID matching).

This could potentially be changed for at24 devices since the i2c
subsystem already matches by name.  It would mean adding the vendor
prefix to all instantiations of the device in the kernel, although it
would mess up the current heuristic used by of_modalias_node() (not a
show-stopper).

>
> So, the current driver may just implement quirks like this:
>
> if (of_device_is_compatible(np, "catalyst,24c32"))
> =A0 =A0 =A0 =A0pagesize =3D 32;
>
> Or, if it's some generic pattern, something like
>
> if (of_device_is_compatible_vendor(np, "catalyst"))
> =A0 =A0 =A0 =A0pagesize /=3D 2;

This would get ugly in a hurry.  It would be better to make it data
driven by searching for a better match in an of_device_id table so
that the workarounds don't grow over time and eventually achieve
sentience.

g.
