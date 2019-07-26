From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC, v3 9/9] media: platform: Add Mediatek ISP P1 shared memory
	device
Date: Fri, 26 Jul 2019 12:04:23 +0100
Message-ID: <4460bc91-352a-7f3a-cbed-1b95e743ca8c@arm.com>
References: <jungo.lin@mediatek.com>
	<20190611035344.29814-1-jungo.lin@mediatek.com>
	<20190611035344.29814-10-jungo.lin@mediatek.com>
	<20190701072532.GB137710@chromium.org>
	<1562297618.1212.46.camel@mtksdccf07>
	<CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
	<1562313579.1212.73.camel@mtksdccf07>
	<CAAFQd5AaNFpMGCVJREY85n8UetEwd99TOka8-ECoLzMbMkos_g@mail.gmail.com>
	<1563870117.1212.455.camel@mtksdccf07>
	<CAAFQd5Bh80N+cMhz=eyHUGJLaE5uuypOawQvHrTgGSMDvmcpLA@mail.gmail.com>
	<20190726074116.GA19745@infradead.org>
	<CAAFQd5CXwRm-3jD+rfNNDNLH=gT_i0QYSAG3XBo3SJnPTY56_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <CAAFQd5CXwRm-3jD+rfNNDNLH=gT_i0QYSAG3XBo3SJnPTY56_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <sean.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= <frankie.chiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, ddavenport-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>linu
List-Id: devicetree@vger.kernel.org

On 26/07/2019 08:42, Tomasz Figa wrote:
> On Fri, Jul 26, 2019 at 4:41 PM Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
>>
>> On Fri, Jul 26, 2019 at 02:15:14PM +0900, Tomasz Figa wrote:
>>> Could you try dma_get_sgtable() with the SCP struct device and then
>>> dma_map_sg() with the P1 struct device?
>>
>> Please don't do that.  dma_get_sgtable is a pretty broken API (see
>> the common near the arm implementation) and we should not add more
>> users of it.  If you want a piece of memory that can be mapped to
>> multiple devices allocate it using alloc_pages and then just map
>> it to each device.
> 
> Thanks for taking a look at this thread.
> 
> Unfortunately that wouldn't work. We have a specific reserved memory
> pool that is the only memory area accessible to one of the devices.
> Any idea how to handle this?

If it's reserved in the sense of being outside struct-page-backed 
"kernel memory", then provided you have a consistent CPU physical 
address it might be reasonable for other devices to access it via 
dma_map_resource().

Robin.
