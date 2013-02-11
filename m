From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V8] kbuild: create a rule to run the pre-processor on
 *.dts files
Date: Mon, 11 Feb 2013 12:11:22 -0700
Message-ID: <5119425A.1090802@wwwdotorg.org>
References: <1360091188-24063-1-git-send-email-swarren@wwwdotorg.org> <20130208144527.0D8DD3E2C01@localhost> <51156D09.7060401@gmail.com> <20130208220448.EDA773E2C27@localhost> <51157F65.2050309@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51157F65.2050309@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Michal Marek <mmarek@suse.cz>, Grant Likely <glikely@secretlab.ca>, Srinivas KANDAGATLA <srinivas.kandagatla@st.com>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, Scott Wood <scottwood@freescale.com>, Stephen Warren <swarren@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

On 02/08/2013 08:45 AM, Grant Likely wrote:
> On Tue,  5 Feb 2013 12:06:28 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> Create cmd_dtc_cpp to run the C pre-processor on *.dts file before
>> passing them to dtc for final compilation. This allows the use of #define
>> and #include within the .dts file.
...
> I've applied this and was going to push it out, but I've just thought of
> a problem that could be a show stopper. ...

Grant, I notice this showed up in next-20130211 as:

22435f3 kbuild: create a rule to run the pre-processor on *.dts files

Was that intentional? I assumed you wanted me to rework this before
you'd apply it, rather than sending an incremental patch.
