From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Cmdline FDT query tool
Date: Tue, 18 May 2010 12:20:05 -0600
Message-ID: <AANLkTinlyoA-FqbtWh939l9qoc6QDnKwPzNVnjgHFcVc@mail.gmail.com>
References: <AANLkTilo68Va3EzuWq3SPzv-YpXt-7Ty7Us_Q0Fw_Nmv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTilo68Va3EzuWq3SPzv-YpXt-7Ty7Us_Q0Fw_Nmv-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 17, 2010 at 8:03 PM, John Williams
<john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org> wrote:
> Hi Grant,
>
> At ELC I mentioned a tool I'd written that basically hacked u-boot's
> "fdt" command into a commandline util for querying DTBs. =A0You can do
> stuff like this:
>
> $ fdt-tool system.dtp print
>
> <dump entire DTB in text format>
>
> $ fdt-tool system.dtb list /cpus/cpu@0 xlnx,use-dcache
> xlnx,use-dcache =3D <0x1>
>
> and so on.

Cool.  Thanks John.

I agree with David.  It would probably be useful to include in the
libfdt (which U-Boot fdt support makes use of too) source repo.  Seems
like a useful tool.

Cheers,
g.
