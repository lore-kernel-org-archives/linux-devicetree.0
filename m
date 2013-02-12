From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V8] kbuild: create a rule to run the pre-processor on
 *.dts files
Date: Tue, 12 Feb 2013 12:27:57 -0700
Message-ID: <511A97BD.9010707@wwwdotorg.org>
References: <1360091188-24063-1-git-send-email-swarren@wwwdotorg.org> <20130208144527.0D8DD3E2C01@localhost> <51156D09.7060401@gmail.com> <20130208220448.EDA773E2C27@localhost> <51157F65.2050309@wwwdotorg.org> <5119425A.1090802@wwwdotorg.org> <20130212180805.556C93E1202@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130212180805.556C93E1202@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Michal Marek <mmarek@suse.cz>, Grant Likely <glikely@secretlab.ca>, Srinivas KANDAGATLA <srinivas.kandagatla@st.com>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, Scott Wood <scottwood@freescale.com>, Stephen Warren <swarren@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

On 02/12/2013 11:08 AM, Grant Likely wrote:
> On Mon, 11 Feb 2013 12:11:22 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> On 02/08/2013 08:45 AM, Grant Likely wrote:
>>> On Tue,  5 Feb 2013 12:06:28 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>>> Create cmd_dtc_cpp to run the C pre-processor on *.dts file before
>>>> passing them to dtc for final compilation. This allows the use of #define
>>>> and #include within the .dts file.
>> ...
>>> I've applied this and was going to push it out, but I've just thought of
>>> a problem that could be a show stopper. ...
>>
>> Grant, I notice this showed up in next-20130211 as:
>>
>> 22435f3 kbuild: create a rule to run the pre-processor on *.dts files
>>
>> Was that intentional? I assumed you wanted me to rework this before
>> you'd apply it, rather than sending an incremental patch.
> 
> Yes it was intentional. I sat on my hands w.r.t. this patch for long
> enough that I didn't want to delay it any longer. However, I still want
> a solution to the problem discussed above before it becomes a
> maintenance disaster.

OK, I'll send an incremental patch to adjust the include paths. It
should be soon; I think I have it written, but am distracted fixing up
Tegra clock driver issues etc.:-(
