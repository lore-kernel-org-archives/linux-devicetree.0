From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RFC v2] media: tvp514x: add OF support
Date: Sun, 3 Feb 2013 18:40:15 +0530
Message-ID: <510E61B7.6030904@ti.com>
References: <1359464832-8875-1-git-send-email-prabhakar.lad@ti.com>
 <510C43A0.7090906@gmail.com>
 <CA+V-a8u6VADw_HfbBN4ESGUXTSMKfVyKZaEf1bhVGACof6qZ8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CA+V-a8u6VADw_HfbBN4ESGUXTSMKfVyKZaEf1bhVGACof6qZ8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2/3/2013 3:43 PM, Prabhakar Lad wrote:
> Hi Sylwester,
> 
> Thanks for the review.
> 
> On Sat, Feb 2, 2013 at 4:07 AM, Sylwester Nawrocki
> <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Prabhakar,
>>
>> On 01/29/2013 02:07 PM, Prabhakar Lad wrote:
>> [...]
>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp514x.txt
>>> b/Documentation/devicetree/bindings/media/i2c/tvp514x.txt
>>> new file mode 100644
>>> index 0000000..55d3ffd
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/tvp514x.txt
>>> @@ -0,0 +1,38 @@
>>> +* Texas Instruments TVP514x video decoder
>>> +
>>> +The TVP5146/TVP5146m2/TVP5147/TVP5147m1 device is high quality,
>>> single-chip
>>> +digital video decoder that digitizes and decodes all popular baseband
>>> analog
>>> +video formats into digital video component. The tvp514x decoder supports
>>> analog-
>>> +to-digital (A/D) conversion of component RGB and YPbPr signals as well as
>>> A/D
>>> +conversion and decoding of NTSC, PAL and SECAM composite and S-video into
>>> +component YCbCr.
>>> +
>>> +Required Properties :
>>> +- compatible: Must be "ti,tvp514x-decoder"
>>
>>
>> There are no significant differences among TVP514* devices as listed above,
>> you would like to handle above ?
>>
>> I'm just wondering if you don't need ,for instance, two separate compatible
>> properties, e.g. "ti,tvp5146-decoder" and "ti,tvp5147-decoder" ?
>>
> There are few differences in init/power sequence tough, I would still
> like to have
> single compatible property "ti,tvp514x-decoder", If you feel we need separate
> property I will change it please let me know on this.

Compatible properties should not use generic part numbers. See one past
discussion here: http://en.usenet.digipedia.org/thread/18472/20788/

Thanks,
Sekhar
