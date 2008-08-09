From: =?ISO-8859-1?Q?S=E9bastien_Chr=E9tien?=
	<sebastien.chretien.enseirb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dtc
Date: Sat, 09 Aug 2008 12:00:57 +0200
Message-ID: <489D6AD9.1070501@gmail.com>
References: <319b0ac50808080546w7bda0293ub9fb4a4160cfd17f@mail.gmail.com>
	<20080808125430.GA4243@pengutronix.de>
	<489C45AC.9080504@grandegger.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <489C45AC.9080504-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Cc: =?ISO-8859-1?Q?S=E9bastien_Ch?=@ozlabs.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thank you. It works fine

Wolfgang Grandegger a =E9crit :
> Wolfram Sang wrote:
>> Hello Sebastien,
>>
>> On Fri, Aug 08, 2008 at 02:46:54PM +0200, S=E9bastien Chr=E9tien wrote:
>>> I would like to download dtc for linux 2.6.26 (powerpc). But the =

>>> link on the
>>> ozlab homepage is dead.
>>> Where can I download it ?
>> Get it here:
>>
>> http://www.jdl.com/software/
>
> Recent kernel versions have dtc included:
>
> http://lxr.linux.no/linux+v2.6.25/arch/powerpc/boot/dtc-src/
>
> If you want to make my-board.dtb, just type:
>
> $ make my-board.dtb
>
> You may need to specific DTS_FLAGS though, e.g.:
>
> $ export DTS_FLAGS=3D"-p 0x1000"
> $ make my-board.dtb
>
> Wolfgang.
>
