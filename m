From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC:PATCH dtc-1.3.0] dtc: Add --strip-disabled option to dtc.
Date: Mon, 20 Aug 2012 12:37:49 +0000
Message-ID: <50322F9C.2070403@freescale.com>
References: <1345034325-26656-1-git-send-email-srinivas.kandagatla@st.com>
 <20120817060415.GC29724@truffula.fritz.box> <502E3632.70208@freescale.com>
 <502E52F3.7090404@st.com> <502E64F9.2020400@freescale.com>
 <5031F706.3050509@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5031F706.3050509-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Content-ID: <A7B09BFC59FD77428303D8EFE43539BC-725oAoX4OcF2GV6JINhBVAC/G2K4zDHf@public.gmane.org>
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
To: "srinivas.kandagatla-qxv4g6HH51o@public.gmane.org" <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: "mmarek-AlSwsSmVLrQ@public.gmane.org" <mmarek-AlSwsSmVLrQ@public.gmane.org>, Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Srinivas KANDAGATLA wrote:
>> >But assuming that this really is the best approach, then it would make
>> >sense for --strip-disabled to leave this node in the dtb, because
>> >otherwise there would be no way to re-enable it.
> --strip-disabled should still get rid for nodes marked as failed
> as-well, because fail means something serious and un-recoverable.

Well, I don't know if that's true.  Does status=fail really mean 
unrecoverable?

-- 
Timur Tabi
Linux kernel developer at Freescale
