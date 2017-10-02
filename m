From: Mauricio Faria de Oliveira <mauricfo-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] drivers: of: increase MAX_RESERVED_REGIONS to 32
Date: Mon, 2 Oct 2017 19:58:30 -0300
Message-ID: <ddd472b4-6eea-80a3-53c6-bd63b565ff63@linux.vnet.ibm.com>
References: <CAL_JsqL29j59wJtmOAuD=N7Tccv2rxEMav90yxTyGTfhwHQUsw@mail.gmail.com>
 <20170926084000.29105-1-stewart@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170926084000.29105-1-stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, obh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/26/2017 05:40 AM, Stewart Smith wrote:
> The simple fix is to bump the length of the array to 32 which "should be
> enough for everyone(TM)".

Tested-by: Mauricio Faria de Oliveira <mauricfo-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

# uname -r
4.14.0-rc3

# dmesg
[    0.000000] opal: OPAL detected !
[    0.000000] crashkernel: memory value expected
[    0.000000] OF: reserved mem: not enough space all defined regions.
[    0.000000] OF: reserved mem: not enough space all defined regions.
[    0.000000] OF: reserved mem: not enough space all defined regions.
[    0.000000] OF: reserved mem: not enough space all defined regions.
[    0.000000] Allocated 2883584 bytes for 2048 pacas at c00000000fd40000
<...>

# uname -r
4.14.0-rc3.of32maxrsvdmemregions

# dmesg | head
[    0.000000] opal: OPAL detected !
[    0.000000] crashkernel: memory value expected
[    0.000000] Allocated 2883584 bytes for 2048 pacas at c00000000fd40000
<...>


-- 
Mauricio Faria de Oliveira
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
