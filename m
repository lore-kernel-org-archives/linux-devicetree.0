From: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] dt:numa: adding numa node mapping for memory nodes.
Date: Tue, 28 Oct 2014 15:50:13 +0800
Message-ID: <544F4AB5.5070107@linaro.org>
References: <1410944189-3608-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com> <541A01B7.8030601@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <541A01B7.8030601-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-9-18 5:48, Nathan Lynch wrote:
> On 09/17/2014 03:56 AM, Ganapatrao Kulkarni wrote:
>> From: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>> This patch adds property "nid" to memory node to provide the memory range to
>> numa node id mapping.
>>
>> Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>> ---
>>  Documentation/devicetree/bindings/numa.txt | 58 ++++++++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/numa.txt
>>
>> diff --git a/Documentation/devicetree/bindings/numa.txt b/Documentation/devicetree/bindings/numa.txt
>> new file mode 100644
>> index 0000000..c4a94f2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/numa.txt
>> @@ -0,0 +1,58 @@
>> +======================================================
>> +numa id binding description
>> +======================================================
>> +
>> +======================================================
>> +1 - Introduction
>> +======================================================
>> +The device node  property "nid(numa node id)" can be added to memory
>> +device node to map the range of memory addresses as defined in property "reg".
>> +The property "nid" maps the memory range to the numa node id, which is used to
>> +find the local and remory pages on numa aware systems.
> 
> "Local" and "remote" memory are notions that relate to some other
> resource -- typically a CPU, but also I/O resources on some systems.  It
> seems to me that a useful NUMA binding would at least specify a "nid"
> property, or something like it, for both cpu and memory nodes.  But this
> document speaks only of memory nodes.

Agreed. and more, I think I/O resources also need such property, it will
have performance influence for the proximity domain of I/O devices too.

Thanks
Hanjun

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
