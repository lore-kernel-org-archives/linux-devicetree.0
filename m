From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] powerpc/mpc5121: add initial support for PDM360NG
	board
Date: Tue, 27 Jul 2010 11:43:29 -0600
Message-ID: <AANLkTimY+Uq7GEF50Qqus4GrTH8g8w_in99G2raaFVV7@mail.gmail.com>
References: <1272882222-12253-1-git-send-email-agust@denx.de>
	<1279892973-24110-1-git-send-email-agust@denx.de>
	<AANLkTi=Ee6HR+Ux0g4V1+81DXUmsO=UDhi6jWsDgGchv@mail.gmail.com>
	<20100727123647.0a3b8832@wker>
	<AANLkTika=KeKcaY_FF8tN5Fy-H+cozjZsGObXoQhKiVh@mail.gmail.com>
	<20100727192856.63edc8e0@wker>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100727192856.63edc8e0@wker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Markus Fischer <markus.fischer.ec-Jj5Fu8i2Z9Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michael Weiss <michael.weiss-Jj5Fu8i2Z9Q@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Wolfgang Grandegger <wg-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 27, 2010 at 11:28 AM, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org> wrote:
> On Tue, 27 Jul 2010 10:58:33 -0600
> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> ...
>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spi@11900 {
>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,m=
pc5121-psc-spi", "fsl,mpc5121-psc";
>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cell-index =3D <9>;
>> >>
>> >> Try to drop the cell-index properties. =A0They are almost always misu=
sed.
>> >
>> > Removing cell-index would require changing the spi driver's probe.
>> > Currently cell-index is used to set spi bus number. What could be used
>> > for bus enumeration instead? Is it okay to use part of the spi node
>> > address? e.g. obtaining the offset 0x11900, masking out the unrelated
>> > bits and shifting by 8 would deliver unique index 9 for PSC9 in SPI
>> > mode. This would work for all 12 PSC SPI controllers of mpc5121.
>>
>> Does the spi bus number really matter? =A0The device tree context gives
>> you a firm association between spi masters and devices which doesn't
>> require assigning a specific bus number. =A0The core spi code can
>> dynamically assign a bus number for the bus by setting bus_num to -1.
>
> The bus number is used in the mpc5121 psc spi driver to obtain correct
> clock for PSC in question (0 to 11) and to enable the PSC clock at probe
> time. Therefore using dynamically assigned bus number would require anoth=
er
> change to the spi driver.

That's unrelated to the bus number.  Use cell-index value directly for
obtaining the clock if you need to; but limit its exposure.  Once
Jeremy gets his common clock architecture merged, then we could
probably migrate to that for obtaining the correct clock without
cell-index.

g.
