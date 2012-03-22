From: viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Thu, 22 Mar 2012 20:23:13 +0530
Message-ID: <CAOh2x=nfXXk=gphfAP1SXzNBhv1ZECTOcvFhNLCqLFtjPRf2Sw@mail.gmail.com>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203211236.37891.arnd@arndb.de>
 <CAOh2x=k6ZfamB8DnPgVPjxZ7E1gTuHOQYg6s1Nd1ybA+TSquWA@mail.gmail.com>
 <201203221420.10127.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0739213550204449113=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203221420.10127.arnd-r2nGTMty4D4@public.gmane.org>
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

--===============0739213550204449113==
Content-Type: multipart/alternative; boundary=f46d043c06e6480b8604bbd611f5

--f46d043c06e6480b8604bbd611f5
Content-Type: text/plain; charset=ISO-8859-1

On Mar 22, 2012 7:50 PM, "Arnd Bergmann" <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
> The direct replacement is of_machine_is_compatible(), but there are a lot
> of cases where it's better to have a local property in the device node
> that a driver is using.

Thanks.

--f46d043c06e6480b8604bbd611f5
Content-Type: text/html; charset=ISO-8859-1

<p><br>
On Mar 22, 2012 7:50 PM, &quot;Arnd Bergmann&quot; &lt;<a href="mailto:arnd-r2nGTMty4D4@public.gmane.org">arnd-r2nGTMty4D4@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The direct replacement is of_machine_is_compatible(), but there are a lot<br>
&gt; of cases where it&#39;s better to have a local property in the device node<br>
&gt; that a driver is using.</p>
<p>Thanks.</p>

--f46d043c06e6480b8604bbd611f5--

--===============0739213550204449113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0739213550204449113==--
