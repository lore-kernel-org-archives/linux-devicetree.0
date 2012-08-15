From: David Gibson <dwg@au1.ibm.com>
Subject: Re: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for
 Pre-Processing.
Date: Wed, 15 Aug 2012 11:11:49 +1000
Message-ID: <20120815011149.GF8136@truffula.fritz.box>
References: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Cc: linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mmarek@suse.cz
List-Id: devicetree@vger.kernel.org

On Mon, Aug 13, 2012 at 09:01:53AM +0100, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> 
> This patch add pre-processing capablity to dtc based on status property.
> Now the dtc has additional option -P to enable Pre-processing based on
> status property.
> 
> The SOCS have lot of device tree infrastructure files which mark the
> device nodes as disabled and the board level device tree enables them if
> required. However while creating device tree blob, the compiler can
> preprocess the nodes and exclude nodes marked as disabled, doing this
> way will reduce the size of device tree blob.
> 
> In our case this has reduced the blob size from 29K to 15K.
> 
> Also nodes with status="disabled" is are never probed by dt platform bus
> code.
> 
> Again, Preprocessing is optional parameter to dtc.

Hrm.

1) Changes to dtc should be made first against upstream dtc at
git://git.jdl.com/software/dtc.git.  The version in the kernel is just
a snapshot of the upstream tree which is updated periodically.

2) I'm not convinced this filtering-by-status is something that
belongs in dtc, but I'm willing to be persuaded.

3) The name has to change.  "preprocess" is far to general a term for
the very specific function you're implementing here.  Especially when
there are serious discussions ongoing about having dtc use cpp or a
similar preprocessor in a general capacity.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

