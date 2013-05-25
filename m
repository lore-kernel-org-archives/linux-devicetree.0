From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v2] media: OF: add sync-on-green endpoint property
Date: Sat, 25 May 2013 20:02:30 +0200
Message-ID: <51A0FCB6.7060609@gmail.com>
References: <1368710287-8741-1-git-send-email-prabhakar.csengg@gmail.com>
 <519F4AE7.8000003@gmail.com>
 <CA+V-a8tMQnjh=8qaRoNhwkdrcoTCK2zofTkCOd79hAMoz5qK2A@mail.gmail.com>
 <51A0C6A8.5090302@gmail.com>
 <CA+V-a8tqQGk1v_QdSsn2rt-OJY5PxoFmr1LLkp1bQQb3GuerMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CA+V-a8tqQGk1v_QdSsn2rt-OJY5PxoFmr1LLkp1bQQb3GuerMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/25/2013 04:26 PM, Prabhakar Lad wrote:
>> Thus it might make sense to have only following integer properties (added
>> >  as needed):
>> >
>> >  composite-sync-active
>> >  sync-on-green-active
>> >  sync-on-comp-active
>> >  sync-on-luma-active
>> >
>> >  This would allow to specify polarity of each signal and at the same time
>> >  the parsing code could derive synchronisation type. A new field could be
>> >  added to struct v4l2_of_parallel_bus, e.g. sync_type and it would be filled
>> >  within v4l2_of_parse_endpoint().
>> >
> I am OK with this option. and I hope you meant "struct
> v4l2_of_bus_parallel" instead
> of " struct v4l2_of_parallel_bus" and to fill sync_type within
> v4l2_of_parse_parallel_bus()
> and not in v4l2_of_parse_endpoint().

Yes, that's what I meant, sorry for this confusion.

Regards,
Sylwester
