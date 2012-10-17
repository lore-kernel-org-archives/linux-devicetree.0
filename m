From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v4 4/5] dt/s3c64xx/spi: Use of_get_child_by_name to get a
 named child
Date: Wed, 17 Oct 2012 16:13:46 +0900
Message-ID: <001701cdac36$f2dcf1f0$d896d5d0$%kim@samsung.com>
References: <1347952249-24672-1-git-send-email-srinivas.kandagatla@st.com>
 <20120922160732.GT4495@opensource.wolfsonmicro.com>
 <5060576D.1020905@gmail.com>
 <20120925110618.GA4428@opensource.wolfsonmicro.com>
 <506AF9A0.1030801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <506AF9A0.1030801-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-language: ko
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: 'Rob Herring' <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Mark Brown' <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, 'Srinivas KANDAGATLA' <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring wrote:
> 
> On 09/25/2012 06:06 AM, Mark Brown wrote:
> > On Mon, Sep 24, 2012 at 07:51:57AM -0500, Rob Herring wrote:
> >> On 09/22/2012 11:07 AM, Mark Brown wrote:
> >>> On Tue, Sep 18, 2012 at 08:10:49AM +0100, Srinivas KANDAGATLA wrote:
> >
> >>>> As follow-up to "dt: introduce of_get_child_by_name to get child node
> by
> >>>> name." patch, This patch removes some of the code duplication in the
> >>>> driver by replacing it with of_get_child_by_name instead.
> >
> >>> Applied, thanks.  Please do use subject lines consistent with the
> thing
> >>> you're submitting against.
> >
> >> This dependency here is not yet applied. I was waiting for some acks
> for
> >> some other conversions in the series. I can take it or ack the
> >> dependency. Probably makes more sense for me to take it as there are
> >> other non-spi patches.
> >
> > Ugh, this isn't in mainline...  looking at the original posting I see
> > this wasn't sent as a threaded patch series, it was sent as a bunch of
> > separate patches, so this got detached from the rest of the series.  I
> > discarded the patch.
> 
> I've applied this one and it's dependency.
> 
Just note, happens following error with non-DT such as s3c6400_defconfig...

LD      drivers/mmc/built-in.o
drivers/spi/spi-s3c64xx.c: In function 's3c64xx_get_slave_ctrldata':
drivers/spi/spi-s3c64xx.c:838: error: implicit declaration of function
'of_get_child_by_name'
drivers/spi/spi-s3c64xx.c:838: warning: assignment makes pointer from
integer without a cast
make[3]: *** [drivers/spi/spi-s3c64xx.o] Error 1
make[2]: *** [drivers/spi] Error 2

I'm not sure anyone is fixing it now?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
