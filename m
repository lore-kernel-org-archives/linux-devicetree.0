From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCHv3 07/15] atmel-isi: remove dependency of the soc-camera
 framework
Date: Fri, 10 Mar 2017 12:25:54 +0100
Message-ID: <e9f9a41c-c1bb-dfca-646c-c0c24e99d939@xs4all.nl>
References: <20170306145616.38485-1-hverkuil@xs4all.nl>
 <20170306145616.38485-8-hverkuil@xs4all.nl>
 <20170310103920.GW3220@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310103920.GW3220-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/03/17 11:39, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks! It's very nice to see one more driver converted to stand-alone one!
> 
> Speaking of which --- this seems to be the second last one. The only
> remaining one is sh_mobile_ceu_camera.c!
> 
> On Mon, Mar 06, 2017 at 03:56:08PM +0100, Hans Verkuil wrote:
>> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>
>> This patch converts the atmel-isi driver from a soc-camera driver to a driver
>> that is stand-alone.
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/media/i2c/soc_camera/ov2640.c         |   23 +-
>>  drivers/media/platform/soc_camera/Kconfig     |    3 +-
>>  drivers/media/platform/soc_camera/atmel-isi.c | 1223 +++++++++++++++----------
>>  3 files changed, 735 insertions(+), 514 deletions(-)
>>

<snip>

>> +static int isi_graph_parse(struct atmel_isi *isi,
>> +			    struct device_node *node)
> 
> Fits on a single line.
> 
>> +{
>> +	struct device_node *remote;
>> +	struct device_node *ep = NULL;
>> +	struct device_node *next;
>> +	int ret = 0;
>> +
>> +	while (1) {
>> +		next = of_graph_get_next_endpoint(node, ep);
>> +		if (!next)
>> +			break;
> 
> You could make this a while loop condition.
> 
>> +
>> +		of_node_put(ep);
> 
> ep is put by of_graph_get_next_endpoint(), no need to do it manually here.
> 
>> +		ep = next;
>> +
>> +		remote = of_graph_get_remote_port_parent(ep);
>> +		if (!remote) {
> 
> of_node_put(ep);
> 
>> +			ret = -EINVAL;
>> +			break;
>> +		}
>> +
>> +		/* Skip entities that we have already processed. */
>> +		if (remote == isi->dev->of_node) {
>> +			of_node_put(remote);
>> +			continue;
>> +		}
>> +
>> +		/* Remote node to connect */
>> +		if (!isi->entity.node) {
> 
> There would have to be something wrong about the DT graph for the two above
> to happen. I guess one could just return an error if something is terribly
> wrong.
> 
> I'm thinking this from the point of view of making this function generic,
> and moving it to the framework as most drivers to something very similar,
> but I'd prefer to get the fwnode patches in first.
> 
>> +			isi->entity.node = remote;
> 
> You could use entity.asd.match.of.node instead, and drop the node field.

Slight problem with this. If I make this change, then the of_node_put below
changes as well:

@@ -1193,7 +1176,7 @@ static int isi_graph_init(struct atmel_isi *isi)
 done:
        if (ret < 0) {
                v4l2_async_notifier_unregister(&isi->notifier);
-               of_node_put(isi->entity.node);
+               of_node_put(isi->entity.asd.match.of.node);
        }

And I get this compiler warning:

  CC [M]  drivers/media/platform/atmel/atmel-isi.o
drivers/media/platform/atmel/atmel-isi.c: In function ‘isi_graph_init’:
drivers/media/platform/atmel/atmel-isi.c:1179:15: warning: passing argument 1 of ‘of_node_put’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
   of_node_put(isi->entity.asd.match.of.node);
               ^~~
In file included from drivers/media/platform/atmel/atmel-isi.c:25:0:
./include/linux/of.h:130:20: note: expected ‘struct device_node *’ but argument is of type ‘const struct device_node *’
 static inline void of_node_put(struct device_node *node) { }
                    ^~~~~~~~~~~


Any suggestions? Just keep the entity.node after all?

Regards,

	Hans

> 
>> +			isi->entity.asd.match_type = V4L2_ASYNC_MATCH_OF;
>> +			isi->entity.asd.match.of.node = remote;
>> +			ret++;
>> +		}
>> +	}
>> +
>> +	of_node_put(ep);
>> +
>> +	return ret;
>> +}


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
