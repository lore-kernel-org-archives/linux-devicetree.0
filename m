From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for
 Pre-Processing.
Date: Wed, 15 Aug 2012 12:04:07 +0000
Message-ID: <502B9037.9020502@freescale.com>
References: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com>
 <20120815011149.GF8136@truffula.fritz.box>
 <CAOZdJXUxguEBJG44kyKH0NW1999a9OBj2M=DEhmf_uSYM6nGaQ@mail.gmail.com>
 <502B70B8.1030709@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <502B70B8.1030709@st.com>
Content-Language: en-US
Content-ID: <DF7454348E599E4B8431BFEFBB875C40@mgd.freescale.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: "srinivas.kandagatla@st.com" <srinivas.kandagatla@st.com>
Cc: David Gibson <dwg@au1.ibm.com>, "mmarek@suse.cz" <mmarek@suse.cz>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Srinivas KANDAGATLA wrote:
>> >Using this option would break a lot of our device trees.

> As this is optional parameter, I did not expect it to break the
> default/existing behavior.
> Correct me am missing anything?

I'm just concerned that someone might accidentally set it and then wonder 
why strange things happen during boot.

-- 
Timur Tabi
Linux kernel developer at Freescale
