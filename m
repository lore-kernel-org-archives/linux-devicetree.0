From: Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Add unflatten_partial_device_tree
Date: Mon, 28 Jun 2010 19:40:00 -0700
Message-ID: <cf16ff7b-9208-4f47-8cea-ed8a8e52d30e@email.android.com>
References: <1277747279-9236-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<aa5152a0-4931-479a-bc89-78ac4922c7f1@SG2EHSMHS006.ehs.local>
	<AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O@mail.gmail.com>
	<20100629012207.GG13509@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100629012207.GG13509@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


>> Another question is what to do with the unflattened tree once it is
>> unflattened.  Some of the existing code expects the node to be part of
>> the global tree.  Those could either be refactored, or the new partial
>> tree could be grafted into the global tree.  Grafting will have the
>> least impact, but it probably isn't a good idea in the long term.
>> Grafting together unrelated trees seems messy to me.
>
>I think I must have missed an earlier discussion.  What's the use case
>for multiple fdt blobs?

FPGA on an add-on board in an x86 host.  Device tree fragment describes the fpga design.  There could be multiple boards in a system.

g.



-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
