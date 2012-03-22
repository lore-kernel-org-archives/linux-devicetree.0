From: viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Thu, 22 Mar 2012 19:16:40 +0530
Message-ID: <CAOh2x=k6ZfamB8DnPgVPjxZ7E1gTuHOQYg6s1Nd1ybA+TSquWA@mail.gmail.com>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203151339.36173.arnd@arndb.de> <4F69BC35.4010400@st.com>
 <201203211236.37891.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6821444112806456367=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203211236.37891.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============6821444112806456367==
Content-Type: multipart/alternative; boundary=f46d043c06e644048804bbd52314

--f46d043c06e644048804bbd52314
Content-Type: text/plain; charset=ISO-8859-1

On Mar 21, 2012 6:09 PM, "Arnd Bergmann" <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> Regarding the spear3xx patches, I'm looking forward to your patches.
> I think spear is simple and clean enough that it can serve as an example
> for others doing DT conversion.

Hi Arnd,

I was doing DT stuff for 3xx and have a doubt
regarding DT. How are boards identified at runtime now? Earlier we had
machine_is_*() to do that.

Also why are both DT_MACHINE_START and MACHINE_START present on some SoC's?

--
Viresh

--f46d043c06e644048804bbd52314
Content-Type: text/html; charset=ISO-8859-1

<p><br>
On Mar 21, 2012 6:09 PM, &quot;Arnd Bergmann&quot; &lt;<a href="mailto:arnd-r2nGTMty4D4@public.gmane.org">arnd-r2nGTMty4D4@public.gmane.org</a>&gt; wrote:<br>
&gt; Regarding the spear3xx patches, I&#39;m looking forward to your patches.<br>
&gt; I think spear is simple and clean enough that it can serve as an example<br>
&gt; for others doing DT conversion. </p>
<p>Hi Arnd,</p>
<p>I was doing DT stuff for 3xx and have a doubt<br>
 regarding DT. How are boards identified at runtime now? Earlier we had machine_is_*() to do that.</p>
<p>Also why are both DT_MACHINE_START and MACHINE_START present on some SoC&#39;s?</p>
<p>--<br>
Viresh <br>
</p>

--f46d043c06e644048804bbd52314--

--===============6821444112806456367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6821444112806456367==--
