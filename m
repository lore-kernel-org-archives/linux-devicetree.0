From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
Date: Sat, 21 May 2011 11:43:38 -0600
Message-ID: <BANLkTikJ0QhEFs=3nFbxd4PcfGAb6_jDjg@mail.gmail.com>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>
	<20110519233958.GB18181@ponder.secretlab.ca>
	<4DD66B8A.5040404@gmail.com>
	<201105201621.03801.arnd@arndb.de> <4DD68614.6090209@gmail.com>
	<80f20ac921a33e9f0bf3e249f539a8ef@kernel.crashing.org>
	<4DD7D24D.2070604@gmail.com>
	<ad5605c2a3d4b36f63f36f52afe89cfd@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ad5605c2a3d4b36f63f36f52afe89cfd-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 21, 2011 at 9:18 AM, Segher Boessenkool
<segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> Identifying actual AMBA devices is already done. The question is how to
>> scan the tree for them and how that relates to regular platform devices.=
 The
>> AMBA devices have a binding like this:
>>
>> compatible =3D "arm,pl011", "arm,amba-device";
>> arm,amba-deviceid =3D <0x00341011>;
>
> Excellent -- so you just find all devices with compatible "arm,amba-devic=
e".
> How that relates to legacy platform devices, I have no idea. =A0But you g=
ot
> a workable device binding :-) =A0Does this sit on a proper (AMBA-type) bu=
s as
> well?

Actually, this is little more than a proposed binding.  I'm not
willing to lock it down quite yet until we've experimented a bit more
with it... but that does need to happen soon.

g.
