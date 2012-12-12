From: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/3] regulator: max77686: Add support for various
 operating modes
Date: Wed, 12 Dec 2012 08:28:36 +0530
Message-ID: <CAM4voanvKFmPoMr4xJKwRMETa0uN4O5+v1Q3+cTWSEXfu22zUQ@mail.gmail.com>
References: <1355120784-31118-1-git-send-email-a.kesavan@samsung.com>
 <1355120784-31118-2-git-send-email-a.kesavan@samsung.com>
 <1355120784-31118-3-git-send-email-a.kesavan@samsung.com>
 <20121210064650.GJ10927@opensource.wolfsonmicro.com>
 <loom.20121210T091624-754@post.gmane.org>
 <CAM4voanevLVXW5_WFts2cjDi-5aAbj1_2=EN1amfp14KnKXNug@mail.gmail.com>
 <20121211125713.GH9097@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121211125713.GH9097-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
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
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 11, 2012 at 6:27 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Mon, Dec 10, 2012 at 02:06:49PM +0530, Abhilash Kesavan wrote:
>> On Mon, Dec 10, 2012 at 1:49 PM, Abhilash Kesavan
>> <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> > Mark Brown <broonie <at> opensource.wolfsonmicro.com> writes:
>
>> >> Binding documenation is mandatory for any new OF properties, please add
>> >> this.
>
>> > Patch 3/3 of this series adds documentation for the max77686-opmode property.
>
> There is no point in splitting changes like this up, it just makes
> review harder - in this case it caused me to not read your patch due
> to the missing documentation.  Put the whole change together unless
> things are getting too big to review.
OK.

Can you please have a look at Doug's proposal for handling the
operating mode generically in patch 3/3 of this series.
If you are OK with it then I'll start work on implementing it.

Thanks,
Abhilash
