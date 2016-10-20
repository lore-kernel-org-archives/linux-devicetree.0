From: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 3/5] powerpc/mm: allow memory hotplug into a
 memoryless node
Date: Thu, 20 Oct 2016 09:38:59 -0500
Message-ID: <20161020143859.qkpwxvphzbvxfup7@arbab-laptop.austin.ibm.com>
References: <1475778995-1420-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1475778995-1420-4-git-send-email-arbab@linux.vnet.ibm.com>
 <872f253d-8a55-246c-2be0-636a588e2dd0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <872f253d-8a55-246c-2be0-636a588e2dd0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bharata B Rao <bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alistair Popple <apopple-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Tang Chen <tangchen-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 20, 2016 at 02:30:42PM +1100, Balbir Singh wrote:
>FYI, these checks were temporary to begin with
>
>I found this in git history
>
>b226e462124522f2f23153daff31c311729dfa2f (powerpc: don't add memory to empty node/zone)

Nice find! I spent some time digging, but this had eluded me.

-- 
Reza Arbab

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
