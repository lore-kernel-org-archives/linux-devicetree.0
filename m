From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] of/flattree: Make unflatten_device_tree() safe to
	call from any arch
Date: Mon, 22 Feb 2010 16:11:48 -0700
Message-ID: <fa686aa41002221511r67c79534od562bef934c4d7a7@mail.gmail.com>
References: <20100222154816.3604.67114.stgit@angua>
	<20100222155059.3604.39718.stgit@angua>
	<20100223095118.bed93bac.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100223095118.bed93bac.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2010 at 3:51 PM, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wr=
ote:
> Hi Grant,
>
> On Mon, 22 Feb 2010 08:50:59 -0700 Grant Likely <grant.likely@secretlab.c=
a> wrote:
>>
>> - If CONFIG_OF_FLATTREE is not set, then make unflatten_device_tree()
>> =A0 an empty #define.
>
> Any reason not to make this a static inline?
>
>> +#define unflatten_device_tree() do {} while(0)
>
> static inline void unflatten_device_tree(void) {}

No reason, just wasn't thinking of that.  I've changed this.

g.

>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr-3FnU+UHB4dMh9ZMKESR00Q@public.gmane.org=
.au
> http://www.canb.auug.org.au/~sfr/
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
