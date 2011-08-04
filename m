From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] dt: remove of_alias_get_id() reference
Date: Thu, 4 Aug 2011 12:42:41 +0100
Message-ID: <CACxGe6vnspztEnUH5odGnK4x_K9Ej3Nt7BxikVQwOr9Uh_ED7g@mail.gmail.com>
References: <20110804102950.10845.67898.stgit@ponder>
	<20110804103336.GE17540@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110804103336.GE17540-UiBtZHVXSwEVvW8u9ZQWYwjfymiNCTlR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 4, 2011 at 11:33 AM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> On Thu, Aug 04, 2011 at 11:30:27AM +0100, Grant Likely wrote:
>> of_alias_get_id() is broken and being reverted. =A0Remove the reference
>> to it and replace with a single incrementing id number.
>>
>> There is no risk of regression here on the imx driver since the imx
>> change to use of_alias_get_id() is commit 22698aa2, "serial/imx: add
>> device tree probe support" which is new for v3.1, and it won't get
>> used unless CONFIG_OF is enabled and the board is booted using a
>> device tree. =A0A single incrementing integer is sufficient for now.
>>
>> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>
>> I'm about to ask Linus to pull this patch through the devicetree/merge
>> branch along with the of_alias revert.
>>
>> =A0drivers/tty/serial/imx.c | =A0 13 ++++---------
>> =A01 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
>> index 827db76..7e91b3d 100644
>> --- a/drivers/tty/serial/imx.c
>> +++ b/drivers/tty/serial/imx.c
>> @@ -1286,22 +1286,17 @@ static int serial_imx_resume(struct platform_dev=
ice *dev)
>> =A0static int serial_imx_probe_dt(struct imx_port *sport,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev)
>> =A0{
>> + =A0 =A0 static int portnum =3D 0;
>
> would it be better to use an IDR here ?

Hmmm, I've not looked at idr before.  Yes, it would probably be the
right thing to do.  This patch is needed to fix a build failure, but
when it is reworked for v3.2 I think idr should be considered.
Thanks!

g.
