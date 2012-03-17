From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] Device Tree Bindings for Freescale TDM controller
Date: Sat, 17 Mar 2012 16:04:54 +0000
Message-ID: <CAOZdJXVVGOwDBAEaWzJwynvrqBgYD-qE-FiFgyPwEfTX5su9Pg@mail.gmail.com>
References: <1331861451-15427-1-git-send-email-poonam.aggrwal@freescale.com>
 <4F63868D.1030507@freescale.com>
 <ACB6D0C0104CFF42A45A5D82A0DD4F3D09D518@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ACB6D0C0104CFF42A45A5D82A0DD4F3D09D518-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Content-ID: <4D61017D1927C54EBC7B0E3E91A13D68-725oAoX4OcF2GV6JINhBVAC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Aggrwal Poonam-B10812 <B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Singh Sandeep-B37400 <B37400-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 17, 2012 at 2:33 AM, Aggrwal Poonam-B10812
<B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>> > + =A0- clock-frequency
>> > + =A0 =A0 =A0Usage: optional
>> > + =A0 =A0 =A0Value type: <u32>
>> > + =A0 =A0 =A0Definition: The frequency at which the TDM block is opera=
ting.
>>
>> Will this frequency ever need to be > 4GHz?
> Don't think so, at max this will be CCB, not sure if CCB on our platforms=
 may get bigger than 4G ever.

Apparently, 4GB is the new 640K.

In Poonam's defense, every clock frequency property in the device tree
is a 32-bit integer.  I've never seen a 64-bit one.

-- =

Timur Tabi
Linux kernel developer at Freescale
