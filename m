From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] of: remove /proc/device-tree
Date: Thu, 21 Mar 2013 12:42:15 +0000
Message-ID: <CACxGe6uTpGmNyPLYD8drGycpH=XKu3s6ngPL6RquQ0DZX3WXGw@mail.gmail.com>
References: <1363791074-16415-1-git-send-email-grant.likely@secretlab.ca>
 <1363791074-16415-3-git-send-email-grant.likely@secretlab.ca>
 <1363791479.12701.9.camel@pasglop>
 <CACxGe6u2wNbPQSOPRCRO0To5UC-b8rXYanv2xv26hk5oaozvPA@mail.gmail.com>
 <1363839594.17680.19.camel@pasglop>
 <CACxGe6sXcg51VhFujsjCsMzF80pdy_QhAposdmya4-C0eEcuUw@mail.gmail.com>
 <1363851836.17680.20.camel@pasglop>
 <CACxGe6thdnQo6sPDccEGzUEkXFDGRD4aq_DJOop6Cincb94ODA@mail.gmail.com>
 <1363869397.17680.24.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1363869397.17680.24.camel@pasglop>
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
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2013 at 12:36 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Thu, 2013-03-21 at 08:16 +0000, Grant Likely wrote:
>> On Thu, Mar 21, 2013 at 7:43 AM, Benjamin Herrenschmidt
>> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> > On Thu, 2013-03-21 at 07:35 +0000, Grant Likely wrote:
>> >> > Shouldn't we have the symlink just be a config option itself ?
>> >> > Eventually distros might want get rid of it completely ..
>> >>
>> >> Why? It is the cheapest thing in the world and it means the ABI
>> >> doesn't change at all.
>> >
>> > It's also gross and forces sysfs to remain in /sys which isn't a kernel
>> > enforced policy afaik.
>>
>> Documentation/sysfs-rules.txt, Line 30
>
> Whatever... it's still gross :-)

ptffff!

g.

--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
