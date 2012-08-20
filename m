From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v2 dtc-1.3.0] dtc: Add --strip-disabled option to dtc(v2).
Date: Mon, 20 Aug 2012 08:25:40 -0500
Message-ID: <E1T3RzA-0002rn-SS@jdl.com>
References: <1345458247-15701-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1345458247-15701-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: mmarek-AlSwsSmVLrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> 
> This patch allows dtc to strip out nodes in its output based on status
> property. Now the dtc has additional long option --strip-disabled to
> strip all the nodes which do not have status property set to "okay" or
> "ok". Nodes which do not have status property are not stripped.
> 
> SOCs have lot of device tree infrastructure files which mark the
> device nodes as disabled and the board level device tree enables them if
> required. However while creating device tree blob, the compiler can
> exclude nodes marked as disabled, doing this way will reduce the size
> of device tree blob. The size change will be significant once the SOC
> adds all the possible devices in to the device trees. As there could be
> 100s of Ips on SOCs but the board actually uses may be 20-25 IP's.
> 
> However care has to be taken if your boardloader is is updating status
> property.
> 
> In our case this has reduced the blob size from 29K to 15K.
> 
> Also nodes with status="disabled" is are never probed by dt platform bus
> code.
> 
> Again, this is an optional parameter to dtc, Can be used by people who
> want to strip all the device nodes which do not have status property set
> to "okay" or "ok".

I don't know.  This all strikes me as a means to hack around
our total lack of a properly constructed tree based on real
data and valid node presence.  That is, if we had a better
means of constructing your tree in the first place, it would
not habve 50% overhead of dead nodes.

It should be built in a positive sense, perhaps with includes, or a
better system, and not edited out based on questionable negative data.

This just seems like a fundamentally wrong approach to me.

jdl
