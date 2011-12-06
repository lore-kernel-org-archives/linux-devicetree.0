From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 3/6] fdt: Add fdtdec functions to read byte
	array
Date: Mon, 5 Dec 2011 16:27:48 -0800
Message-ID: <CAPnjgZ2xevBPfTMT2UghHSiQwS7ZFfEuLt1bVfjTj=5fDi_CFA@mail.gmail.com>
References: <1322881071-11148-1-git-send-email-sjg@chromium.org>
	<1322881071-11148-4-git-send-email-sjg@chromium.org>
	<4EDD59D0.9090607@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4EDD59D0.9090607@nvidia.com>
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
Cc: Anton Staff <robotboy@chromium.org>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Dec 5, 2011 at 3:54 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/02/2011 07:57 PM, Simon Glass wrote:
>> From: Anton Staff <robotboy@chromium.org>
>>
>> Sometimes we don't need a full cell for each value. This provides
>> a simple function to read a byte array, both with and without
>> copying it.
>
>> +const u8 *fdtdec_locate_byte_array(const void *blob, int node,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *prop_na=
me, int count)
>> +{
>> + =A0 =A0 const u8 *cell;
>> + =A0 =A0 int err;
>> +
>> + =A0 =A0 cell =3D get_prop_len(blob, node, prop_name, count, &err);
>
> Isn't that called get_prop_check_min_len() now?

It depends on your definition of 'now'. I will of course rebase this
series and test once the usb one is ready. At present it is probably
based on the original v1 usb series. But there may be other changes
too...

Regards,
Simon

>
>> + =A0 =A0 if (err)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>> + =A0 =A0 return cell;
>> +}
>
> --
> nvpublic
